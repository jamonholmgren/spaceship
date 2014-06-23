module KeyHelper

  def key(key, &callback)
    @key_responders ||= {}
    @key_responders[key] = callback
  end

  def keyDown(event)
    handle_key_event(event, true)
  end

  def keyUp(event)
    handle_key_event(event, false)
  end

  private

  def handle_key_event(event, key_down)
    if (event.modifierFlags & NSNumericPadKeyMask)
      character = event.charactersIgnoringModifiers
      if (character.length == 1)
        case character.characterAtIndex(0)
        when NSUpArrowFunctionKey     then call_key_responder(:up, key_down)
        when NSLeftArrowFunctionKey   then call_key_responder(:left, key_down)
        when NSRightArrowFunctionKey  then call_key_responder(:right, key_down)
        when NSDownArrowFunctionKey   then call_key_responder(:down, key_down)
        end
      end
    end

    event.characters.chars.each do |c|
      case c
      when ' ' then call_key_responder(:space, key_down)
      else call_key_responder(c, key_down)
      end
    end
  end

  def call_key_responder(key, key_down)
    @key_responders ||= {}
    if @key_responders[key]
      responder_arity_array = [key_down].first(@key_responders[key].arity)
      @key_responders[key].call(*responder_arity_array)
    end
  end
end

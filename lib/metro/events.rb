class Events

  attr_reader :scene, :up_actions, :down_actions

  def initialize(scene)
    @scene = scene
    @up_actions ||= Hash.new(:_no_action)
    @down_actions ||= Hash.new(:_no_action)
  end

  def on_up(*args,&block)
    options = (args.last.is_a?(Hash) ? args.pop : {})

    args.each do |keystroke|
      @up_actions[keystroke] = block || lambda { |instance| send(options[:do]) }
    end
  end

  def on_down(*args,&block)
    options = (args.last.is_a?(Hash) ? args.pop : {})
    args.each do |keystroke|
      @down_actions[keystroke] = block || lambda { |instance| send(options[:do]) }
    end
  end

  def button_up(id)
    action = up_actions[id]
    scene.instance_eval(&action)
  end

  def fire_downer_events
    down_actions.each do |key,action|
      if scene.window.button_down?(key)
        scene.instance_eval(&action)
      end
    end
  end

  def button_down(id)
    warn "This event currently does not fire"
  end

end
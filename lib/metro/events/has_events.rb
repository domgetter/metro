require_relative 'event_factory'

module Metro

  module HasEvents

    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods

      #
      # Register an event for the scene.
      #
      # @example Registering for a save complete event that would re-enable a menu.
      #
      #     class ExampleScene
      #       event :notification, :save_complete do
      #         menu.enabled!
      #       end
      #     end
      #
      # @example Registering for button held events
      #
      #     class ExampleScene
      #       event :on_hold Gosu::KbLeft, Gosu::GpLeft do
      #         player.turn_left
      #       end
      #
      #       event :on_hold, Gosu::KbRight, Gosu::GpRight do
      #         player.turn_right
      #       end
      #
      #       event :on_hold, Gosu::KbUp, Gosu::GpButton0, do: :calculate_accleration
      #
      #       def calculate_acceleration
      #         long_complicated_calculated_result = 0
      #         # ... multi-line calculations to determine the player acceleration ...
      #         player.accelerate = long_complicated_calculated_result
      #       end
      #     end
      #
      # @example Registering for a button down event to call a method named 'next_option'
      #
      #     class ExampleScene
      #        event :on_up, Gosu::KbEscape, do: :leave_scene
      #
      #       def leave_scene
      #         transition_to :title
      #       end
      #     end
      #
      # Here in this scene if the Escape Key is pressed and released the example scene
      # will transition to the title scene.
      #
      # @example Registering for a button up event with a block of code to execute
      #
      #     class ExampleScene
      #       event :on_up, Gosu::KbEscape do
      #        transition_to :title
      #       end
      #     end
      #
      # @example Registering for a button down event to call a method named 'previous_option'
      #
      #     class ExampleScene
      #       event :on_down, Gosu::GpLeft, Gosu::GpUp, do: :previous_option
      #
      #       def previous_option
      #         @selected_index = @selected_index - 1
      #         @selected_index = options.length - 1 if @selected_index <= -1
      #       end
      #     end
      #
      # Here in this scene if the GpLeft or GpUp buttons are pressed down the method
      # `previous_options` will be executed.
      #
      #
      # @example Registering for a button down event with a block of code to execute
      #
      #     class ExampleScene
      #        event :on_down, Gosu::GpLeft, Gosu::GpUp do
      #         @selected_index = @selected_index - 1
      #         @selected_index = options.length - 1 if @selected_index <= -1
      #       end
      #     end
      #
      # This example uses a block instead of a method name but it is absolultey the same
      # as the last example.
      #
      def event(event_type,*buttons,&block)
        scene_event = EventFactory.new event_type, buttons, &block
        events.push scene_event
      end

      #
      # @return a list of all the EventFactories defined for the scene
      #
      def events
        @events ||= []
      end

    end

  end

end
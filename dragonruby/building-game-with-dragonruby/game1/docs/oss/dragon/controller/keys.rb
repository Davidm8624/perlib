# coding: utf-8

# Copyright 2019 DragonRuby LLC
# MIT License
# controller/keys.rb has been released under MIT (*only this file*).

module GTK
  class Controller
    def left_hand
      @left_hand  ||= {
        position: { x: 0, y: 0, z: 0 },
        orientation: { x: 0, y: 0, z: 0 }
      }
    end

    def right_hand
      @right_hand ||= {
        position: { x: 0, y: 0, z: 0 },
        orientation: { x: 0, y: 0, z: 0 }
      }
    end

    class Keys
      include Serialize

      LABELS = [
        :up, :down, :left, :right,
        :a, :b, :x, :y,
        :l1, :r1,
        :l2, :r2,
        :l3, :r3,
        :start, :select, :home,
        :directional_up, :directional_down, :directional_left, :directional_right
      ].freeze

      LABELS.each do |label|
        attr label
      end

      alias_method :dpad_up, :directional_up
      alias_method :dpad_down, :directional_down
      alias_method :dpad_left, :directional_left
      alias_method :dpad_right, :directional_right

      alias_method :up_dpad, :directional_up
      alias_method :down_dpad, :directional_down
      alias_method :left_dpad, :directional_left
      alias_method :right_dpad, :directional_right

      def back
        @select
      end

      def back= value
        @select = value
      end

      def guide
        @home
      end

      def guide= value
        @home = value
      end

      # Activate a key.
      #
      # @return [void]
      def activate key
        instance_variable_set("@#{key}", Kernel.tick_count + 1)
      end

      # Deactivate a key.
      #
      # @return [void]
      def deactivate key
        instance_variable_set("@#{key}", nil)
      end

      # Clear all key inputs.
      #
      # @return [void]
      def clear
        LABELS.each { |label| deactivate(label) }
      end

      def truthy_keys
        LABELS.select { |label| send(label) }
      end
    end
  end
end

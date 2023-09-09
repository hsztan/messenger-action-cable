module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      @current_user = find_verified_user
    end

    private

      def find_verified_user
        env['warden'].user || reject_unathorized_connection
      end
  end
end

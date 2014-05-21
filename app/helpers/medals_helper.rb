module MedalsHelper
	# Returns a dynamic path based on the provided parameters
	def sti_medal_path(type = "medal", medal = nil, action = nil)
	  send "#{format_sti(action, type, medal)}_path", medal
	end

	def format_sti(action, type, medal)
	  action || medal ? "#{format_action(action)}#{type.underscore}" : "#{type.underscore.pluralize}"
	end

	def format_action(action)
	  action ? "#{action}_" : ""
	end
end

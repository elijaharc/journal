module ApplicationHelper
    def page_entries_info(collection, options = {})
        entry_name = options[:entry_name] || (collection.empty?? 'item' :
            collection.first.class.name.split('::').last.titleize).downcase
        if collection.total_pages < 2
          case collection.size
          when 0; "No #{entry_name.pluralize} found"
          when 1; "Displaying #{@tasks.count} #{entry_name}"
          else; "Displaying all #{@tasks.count} #{entry_name.pluralize}"
          end
        else
          %{Displaying %d - %d of %d #{entry_name.pluralize}} % [
            collection.offset + 1,
            collection.offset + collection.length,
            collection.total_entries
          ]
        end
      end
end

module ApplicationHelper
  def table_recursive(x)
    if attributes = x.try(:attributes)
      tag.table style: "border: 1px solid black; text-align: left;" do
        attributes.map do |k, v|
          concat(tag.tr do
            concat(tag.th do
              k
            end)
            concat(tag.td do
              table_recursive(v)
            end)
          end)
        end
      end
    else
      x
    end
  end
end

<%= render("instedd/flash_messages") %>
var current = $('#<%=item_id%>')
current.after("<%= escape_javascript(render partial: partial, locals: { model: model } ) %>");
current.remove();

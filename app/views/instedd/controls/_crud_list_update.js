<%
item_id = controller._crud_item_id(key, model)
%>
<%= render("instedd/flash_messages") %>
var current = $('#<%=item_id%>');
current.after("<%= escape_javascript(render partial: 'instedd/controls/crud_list_item', locals: { key: key, model: model, expanded: expanded } ) %>");
current.remove();

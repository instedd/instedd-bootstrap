<%
item_id = controller._crud_item_id(key, model)
%>
<%= render("instedd/flash_messages") %>
$('#<%=item_id%>').remove();

<%
create_id = controller._crud_create_id(key)
%>
<%= render("instedd/flash_messages") %>
$('#<%=create_id%>').before("<%= escape_javascript(render('instedd/controls/crud_list_item', {key: key, model: model, expanded: false}))%>").collapse('hide');
$('#<%=create_id%> .create_partial').html("<%= escape_javascript(render controller._crud_list_option(key, :new), { model: create_model } ) %>");

$(document).ready(function()
{
if ($("#alertSuccess").text().trim() == "")
 {
 $("#alertSuccess").hide();
 }
 $("#alertError").hide();
});




//SAVE ============================================
$(document).on("click", "#btnSave", function(event)
{
// Clear alerts---------------------
 $("#alertSuccess").text("");
 $("#alertSuccess").hide();
 $("#alertError").text("");
 $("#alertError").hide();
// Form validation-------------------


var type = ($("#hidIdSave").val() == "") ? "POST" : "PUT";


$.ajax(
		{
		 url : "ProjectAPI",
		 type : type,
		 data : $("#formProject").serialize(),
		 dataType : "text",
		 complete : function(response, status)
		 {
		 onDoctorSaveComplete(response.responseText, status);
		 }
		});

});
function onDoctorSaveComplete(response, status)
{
if (status == "success")
 {
	var resultSet = JSON.parse(response);
	if (resultSet.status.trim() == "success")
	{
		$("#alertSuccess").text("Successfully saved.");
		$("#alertSuccess").show();
		
		$("#divDoctorGrid").html(resultSet.data);
	} else if (resultSet.status.trim() == "error")
	{
		$("#alertError").text(resultSet.data);
		$("#alertError").show();
	}
 	} else if (status == "error")
 	{
 		$("#alertError").text("Error while saving.");
 		$("#alertError").show();
 	} else
 	{
 		$("#alertError").text("Unknown error while saving..");
 		$("#alertError").show();
 	}
		$("#hidIdSave").val("");
		$("#formProject")[0].reset();
}

//UPDATE==========================================
$(document).on("click", ".btnUpdate", function(event)
{
 $("#hidIdSave").val($(this).closest("tr").find('#hiddoctorIdUpdate').val());
 $("#proCode").val($(this).closest("tr").find('td:eq(0)').text());
 $("#proName").val($(this).closest("tr").find('td:eq(1)').text());
 $("#proPrice").val($(this).closest("tr").find('td:eq(2)').text());
 $("#proDesc").val($(this).closest("tr").find('td:eq(3)').text());
 $("#proType").val($(this).closest("tr").find('td:eq(4)').text());


});


$(document).on("click", ".btnRemove", function(event)
		{
		 $.ajax(
		 {
		 url : "ProjectAPI",
		 type : "DELETE",
		 data : "proID=" + $(this).data("itemid"),
		 dataType : "text",
		 complete : function(response, status)
		 {
		 onDoctorDeleteComplete(response.responseText, status);
		 }
		 });
		});

function onDoctorDeleteComplete(response, status)
{
if (status == "success")
 {
 var resultSet = JSON.parse(response);
 if (resultSet.status.trim() == "success")
 {
 $("#alertSuccess").text("Successfully deleted.");
 $("#alertSuccess").show();
 $("#divDoctorGrid").html(resultSet.data);
 } else if (resultSet.status.trim() == "error")
 {
 $("#alertError").text(resultSet.data);
 $("#alertError").show();
 }
 } else if (status == "error")
 {
 $("#alertError").text("Error while deleting.");
 $("#alertError").show();
 } else
 {
 $("#alertError").text("Unknown error while deleting..");
 $("#alertError").show();
 }
}

//CLIENTMODEL=========================================================================





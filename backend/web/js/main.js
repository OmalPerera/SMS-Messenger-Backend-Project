$(function(){
	//alert('qwertyui');

	/*	loads Bootstrap model to create a group	
		Used in the recipient-list index view
	*/
	$('#create_groups_button').click(function (){
		$('#create_groups_modal').modal('show')
			.find('#create_groups_modalContent')
			.load($(this).attr('value'));
	});


	/*	loads Bootstrap model to create a recipient
		Used in the recipient-list index view 
	*/
	$('#create_recipient_button').click(function (){
		$('#create_recipient_modal').modal('show')
			.find('#create_recipient_modalContent')
			.load($(this).attr('value'));
	});


	/*	loads the index page of the user-groups to the <div>
		on the recipient-list view (user choose his groups from here)
	*/
	$("#group_list")
		.load("index.php?r=user-group");

	
});
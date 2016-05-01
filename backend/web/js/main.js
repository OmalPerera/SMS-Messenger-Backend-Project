$(function(){
	//alert('qwertyui');
	$('#create_groups_button').click(function (){
		$('#create_groups_modal').modal('show')
			.find('#create_groups_modalContent')
			.load($(this).attr('value'));
	})
});
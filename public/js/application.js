$(document).ready(function(){
	$('.button_upvote').click(function(e){
		console.log('pressed')
		//console.log('start')
		e.preventDefault();
		//debugger	
		//question_id =$(this).attr("value")
		// console.log(question_id)
		question_id = e.target.value
		url = '/questions/' + question_id + '/votes'
		$.ajax({
			url: url,
			method: 'get',
			data: {},
			dataType: 'json',
			success:function(data){
				console.log("success path");
				button_id = 'button_upvote' + question_id;
				$('#'+button_id).text('Upvote | ' + data.length);

			},
			error:function(data){
				console.log("error path");	
			}
		});
	});
});
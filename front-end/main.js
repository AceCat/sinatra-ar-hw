$.ajax({
	method: 'GET',
	url: 'http://localhost:9393/characters',
	success: function(response) {
		console.log(response)
			$('#characterName').text(response.characters[0].name);
			$('#organizationName').text(response.characters[0].organization);
			$('#characterRole').text(response.characters[0].role);
			$('#characterImage').attr("src", response.characters[0].image_url);
			for (i = 0; i < response.organizations.length; i++){
				$('#membershipList').append('<li>' + response.organizations[i].organization_name[i] + '</li>')
			}
		}
});
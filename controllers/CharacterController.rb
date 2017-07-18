class CharacterController < Sinatra::Base

	get '/' do
		response['Access-Control-Allow-Origin'] = '*'
		content_type :json
		characters = Character.all
		organizations = []
		characters.each do |character|
			organizations.push(character.organizations)
		end
		{'characters': characters, 'organizations': organizations}.to_json
end

	get '/:id' do
		response['Access-Control-Allow-Origin'] = '*'
		content_type :json
		id = params[:id]
		characters = Character.all
		character = Character.find(id)
		organizations = character.organizations
		{'character': character, 'organization': organizations}.to_json
	end

	post '/' do
		request_body = JSON.parse(request.body.read)
		new_character = Character.new(request_body)
		new_character.save
		new_character.to_json
	end


	patch '/:id' do
		id = params[:id]
		character = Character.find(id)
		request_body = JSON.parse(request.body.read)
		character.update_attributes(request_body)
		character.save
		character.to_json
	end


	delete '/:id' do
		id = params[:id]
		character = Character.find(id)
		character.destroy
		characters = Character.all
		characters.to_json
	end
end
package pl.com.home.logic

class User {
	var int id
	var String name
	var String login

	new(int id, String name) {
		this.id   = id
		this.name = name
	}

	def long getId() {
		return id
	}

	def String getname() {
		return name
	}

	def String getLogin() {
		return login
	}
}
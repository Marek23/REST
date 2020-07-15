package pl.com.home.logic

class User {
	var int id
	var String name

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
}
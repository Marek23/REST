package pl.com.home.model

class Simple {
	var String field1
	var String field2
	var String field3

	new(String f1, String f2, String f3) {
		this.field1 = f1
		this.field2 = f2
		this.field3 = f3
	}

	def getField1() {
		return field1
	}

	def getField2() {
		return field2
	}

	def getField3() {
		return field3
	}

	override String toString() {
		return field1 + field2 + field3
	}
}
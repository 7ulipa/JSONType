import JSONType

struct A: JSONType {
	let name: String?
	let id: Int?
	let b: B?

	init?(rawValue: Any?) {
		name = String.pick(from: rawValue, with: "a_name")
		id = Int.pick(from: rawValue, with: "a_id")
		b = B.pick(from: rawValue, with: "b")
	}
}

struct B: JSONType {
	let name: String?
	let id: Int?

	init?(rawValue: Any?) {
		name = String.pick(from: rawValue, with: "b_name")
		id = Int.pick(from: rawValue, with: "b_id")
	}
}


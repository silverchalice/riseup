class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/register" {
          controller = "order"
          action = "new_order"
        }

        "/"(view:"/index")
        "500"(view:'/error')
	}
}

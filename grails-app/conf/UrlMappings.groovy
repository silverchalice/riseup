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

        "/login" {
          controller = "home"
          action = "login"
        }

        "/forgot_password" {
          controller = "home"
          action = "forgot_password"
        }

        "/change_password" {
          controller = "home"
          action = "change_password"
        }

        "/logout" {
          controller = "home"
          action = "logout"
        }

        "/"(controller:"home", action: "index")
        "500"(view:'/error')
	}
}

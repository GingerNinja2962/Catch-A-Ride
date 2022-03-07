package WeThinkCode.co.za.RouteHandler;

import io.javalin.Javalin;

import static io.javalin.apibuilder.ApiBuilder.get;
import static io.javalin.apibuilder.ApiBuilder.path;

public class routeHandler {
//<editor-fold desc="======[ PUBLIC FUNCTIONS ]=======">

    public Javalin route(Javalin server) {
        server.routes(() -> {
            indexRoute();
            pingRoute();
        });
        return server;
    }

//</editor-fold>
//<editor-fold desc="======[ PRIVATE FUNCTIONS ]======">

    private void pingRoute() {
        path( "/ping", () -> get(context -> {
            context.result("The server is running.");
        }));
    }

    private void indexRoute() {
        path( "", () -> get(context -> {
            context.result("This is the home page.");
        }));
    }

//</editor-fold>
}

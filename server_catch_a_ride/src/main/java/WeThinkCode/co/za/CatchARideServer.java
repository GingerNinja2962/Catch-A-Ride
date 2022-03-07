package WeThinkCode.co.za;

import WeThinkCode.co.za.RouteHandler.routeHandler;
import io.javalin.Javalin;

public class CatchARideServer {
    private static Javalin theServer;
    private static int serverPort = 2962;

//<editor-fold desc="======[ MAIN ]======">

    public static void main(String[] args) {
        theServer = Javalin.create();
        new routeHandler().route(theServer).start(serverPort);
    }

//</editor-fold>
}

import java.rmi.*;
import java.rmi.server.*;
import java.io.Serializable;


interface rmi extends Remote
{
	
	Object dotask(Task t);
	
}


interface Task extends Serializable {
    Object execute();
}


 class ComputeEngine extends UnicastRemoteObject
                           implements rmi
{
    public ComputeEngine() throws RemoteException {
        super();
    }

    public Object dotask(Task t) {
        return t.execute();
    }

    public static void main(String[] args) {
        if (System.getSecurityManager() == null) {
            System.setSecurityManager(new RMISecurityManager());
        }
        String name = "//host/Compute";
        try {
            rmi engine = new ComputeEngine();
            Naming.rebind(name, engine);
            System.out.println("ComputeEngine bound");
        } catch (Exception e) {
            System.err.println("ComputeEngine exception: " + 
			       e.getMessage());
            e.printStackTrace();
        }
    }
}

package abstractfactory3;

//GuiFactory example

//Abstract Product
interface Button {
	void paint();
}
//Abstract Product
interface Label {
	void paint();
}

//Abstract Factory
interface GUIFactory {
	Button createButton();
	Label createLabel();
}

//Concrete Factory
class WinFactory implements GUIFactory {
	public Button createButton() {
		return new WinButton();
	}

	public Label createLabel() {
		return new WinLabel();
	}
}

//Concrete Factory
class OSXFactory implements GUIFactory {
	public Button createButton() {
		return new OSXButton();
	}

	public Label createLabel() {
		return new OSXLabel();
	}

}

//Concrete Product
class OSXButton implements Button {
	public void paint() {
		System.out.println("I'm an OSXButton");
	}
}

//Concrete Product
class WinButton implements Button {
	public void paint() {
		System.out.println("I'm a WinButton");
	}
}

//Concrete Product
class OSXLabel implements Label {
	public void paint() {
		System.out.println("I'm an OSXLabel");
	}
}

//Concrete Product
class WinLabel implements Label {
	public void paint() {
		System.out.println("I'm a WinLabel");
	}
}

//Client application is not aware about the how the product is created. Its only responsible to give a name of 
//concrete factory
class Application {
	public Application(GUIFactory factory) {
		Button button = factory.createButton();
		Label label = factory.createLabel();
		button.paint();
		label.paint();
	}
}

public class AbtractFactory3 {
	public static void main(String[] args) {
		new Application(createOsSpecificFactory());
	}

	public static GUIFactory createOsSpecificFactory() {
		String osname = System.getProperty("os.name").toLowerCase();
		if(osname != null && osname.contains("windows"))
			return new WinFactory();
		else
			return new OSXFactory();
	}
}
package dto;

public class CarViewBean {
	private String name;
	private int price;
	private String img;
	private int qty; //����
	private int userin; //��������
	private int useaircon;
	private int usesmartkey;
	private int usewifi; //Wifi ����
	private int useseat;  //���̺��Ʈ ����
	private int usenavi; //���̰��̼� ����
	private int reserveno; //���� ���̵�
	public String getName() {
		return name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public int getUserin() {
		return userin;
	}
	public void setUserin(int userin) {
		this.userin = userin;
	}
	public int getUseaircon() {
		return useaircon;
	}
	public void setUseaircon(int useaircon) {
		this.useaircon = useaircon;
	}
	public int getUsesmartkey() {
		return usesmartkey;
	}
	public void setUsesmartkey(int usesmartkey) {
		this.usesmartkey = usesmartkey;
	}
	public int getUsewifi() {
		return usewifi;
	}
	public void setUsewifi(int usewifi) {
		this.usewifi = usewifi;
	}
	public int getUseseat() {
		return useseat;
	}
	public void setUseseat(int useseat) {
		this.useseat = useseat;
	}
	public int getUsenavi() {
		return usenavi;
	}
	public void setUsenavi(int usenavi) {
		this.usenavi = usenavi;
	}
	public int getReserveno() {
		return reserveno;
	}
	public void setReserveno(int reserveno) {
		this.reserveno = reserveno;
	}
	public void setName(String name) {
		this.name = name;
	}
	

}

package dto;

public class CarReserveBean {
	private int reserveno; //예약 아이디
	private int no; //차량 아이디
	private String id; //유저 아이디
	private int qty; //수량
	private int useaircon;
	private int usesmartkey;
	private int userin; //보험적용
	private int usewifi; //Wifi 적용
	private int useseat;  //베이비시트 적용
	private int usenavi; //네이게이션 적용
	@Override
	public String toString() {
		return "CarReserveBean [reserveno=" + reserveno + ", no=" + no + ", id=" + id + ", qty=" + qty + ", useaircon="
				+ useaircon + ", usesmartkey=" + usesmartkey + ", userin=" + userin + ", usewifi=" + usewifi
				+ ", useseat=" + useseat + ", usenavi=" + usenavi + "]";
	}
	public int getReserveno() {
		return reserveno;
	}
	public void setReserveno(int reserveno) {
		this.reserveno = reserveno;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
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
	public int getUserin() {
		return userin;
	}
	public void setUserin(int userin) {
		this.userin = userin;
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
	
	
	

	
	
}
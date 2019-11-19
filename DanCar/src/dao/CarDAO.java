package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import java.util.ArrayList;
import java.util.List;
import java.util.Vector;
import dto.CarViewBean;
import dto.CarReserveBean;
import dto.Car;
import jdbc.ConnectionProvider;




public class CarDAO {
	private CarDAO() { 
	}
	
	
	private static CarDAO instance = new CarDAO();
	public static CarDAO getInstance(){
		return instance;
	} 
	
	// selectList
		public List<Car> selectList(Connection conn) throws SQLException {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				String sql = "select * from car";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				List<Car> carList = new ArrayList<>();
				while (rs.next()) {
					carList.add(createFromResultSet(rs));
				}
				return carList;
			} finally {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
			}
		}
		

	
	public Car createFromResultSet(ResultSet rs) throws SQLException {
		int no = rs.getInt("no");
		String carnumber = rs.getString("carnumber");
		String name = rs.getString("name");
		int cartype = rs.getInt("cartype");
		String price = rs.getString("price");
		String company = rs.getString("company");
		String fueltype = rs.getString("fueltype");
		String modelyear = rs.getString("modelyear");
		String img = rs.getString("img");
		
		Car car = new Car(no,carnumber, name, cartype, price, company, fueltype,modelyear,img);
		return car;
	}
	
	//최신순 자동차 3대만 선택
		public Vector<Car> getSelectCar() throws SQLException {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			Vector<Car> v = new Vector<Car>();
			
			try {
				String sql ="select * from car";	
				conn = ConnectionProvider.getConnection();
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				int count = 0;
				
				while (rs.next()) {
					Car bean = new Car();
					bean.setNo(rs.getInt(1));
					bean.setCarnumber(rs.getString(2));
					bean.setName(rs.getString(3));
					bean.setPrice(rs.getString(4));
					bean.setCompany(rs.getString(5));
					bean.setFueltype(rs.getString(6));
					bean.setModelyear(rs.getString(7));
					bean.setCartype(rs.getInt(8));
					bean.setImg(rs.getString(9));
					v.add(bean);
					count++;
					if(count > 3) break;
					
				}
				return v;
				} finally {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
			}
		}
	
	public Vector<Car> getAllCar() throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection conn = null;
		try {
			String sql = "select * from car";
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			Vector<Car> v = new Vector<>();
			while(rs.next()) {
				v.add(createFromResultSet(rs));
			}
			return v;
			
		} finally {
			if(rs!= null) {
				rs.close();
			}
			if(pstmt != null) {
				pstmt.close();
			}
		}	
	}
	public Car getOneCar(int no) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Connection conn = null;
		Car bean = new Car();
		
		try {
			String sql ="select * from car where no=?";
			conn = ConnectionProvider.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				
				bean.setNo(rs.getInt(1));
				bean.setCarnumber(rs.getString(2));
				bean.setName(rs.getString(3));
				bean.setPrice(rs.getString(4));
				bean.setCompany(rs.getString(5));
				bean.setFueltype(rs.getString(6));
				bean.setModelyear(rs.getString(7));
				bean.setCartype(rs.getInt(8));
				bean.setImg(rs.getString(9));
			}
			return bean;
			
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
		} 
	}
	
	
		
		// CartypeList
				public List<Car> CartypeList(int cartype) throws SQLException {
					Connection conn = null;
					PreparedStatement pstmt = null;
					ResultSet rs = null;
					try {
						String sql = "select * from car where cartype=" + cartype;
						conn = ConnectionProvider.getConnection();
						pstmt = conn.prepareStatement(sql);
						
						rs = pstmt.executeQuery();
						List<Car> carList = new ArrayList<>();
						if (rs.next()) {
							carList.add(createFromResultSet(rs));
						}
						return carList;
					} finally {
						if (rs != null) {
							rs.close();
						}
						if (pstmt != null) {
							pstmt.close();
						}
					}
				}
	
	
	
	
	

	//회원 정보가 있는지를 비교
	public int getMember(String id, String pass) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result =0;
	
		try{
			String sql ="select count(*) from member where id =? and pass=?";
			pstmt =conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			rs=pstmt.executeQuery();
			if(rs.next()){
				result=rs.getInt(1);//0또는 1값이 저장됨
			}
		
		} finally{
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
		}
		return result;
	}
	
	//하나의 예약 정보를 저장하는 메소드
	public int setReserveCar(CarReserveBean  bean) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			String sql ="insert into carreserve (reserveno, no, id, qty, userin, usewifi, useseat, usenavi,useaiccon,usesmartkey )"
					+ " VALUES(RESERVE_SEQ.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt =conn.prepareStatement(sql);
			
			System.out.println(bean.toString());
			pstmt.setInt(1, bean.getNo());
			pstmt.setString(2, bean.getId());
			pstmt.setInt(3, bean.getQty());
			pstmt.setInt(4, bean.getUserin());
			pstmt.setInt(5, bean.getUsewifi());
			pstmt.setInt(6, bean.getUseseat());
			pstmt.setInt(7, bean.getUsenavi());
			pstmt.setInt(8, bean.getUseaircon());
			pstmt.setInt(9, bean.getUsesmartkey());
			return pstmt.executeUpdate();
		} finally {
			if (pstmt != null) {
				pstmt.close();
			}}}
	
	
	//회원의 예약정보를 리턴하는 메소드
	public Vector<CarViewBean> getAllReserve(String id) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Vector<CarViewBean> v=new Vector<CarViewBean>();
		CarViewBean bean=null;
		
		try{
			//쿼리문
			String sql="select * from  RENTCAR natural join CARRESERVE "
					+ " where  sysdate < to_date(rday, 'YYYY-MM-DD') and id= ?";
			
			pstmt =conn.prepareStatement(sql);
			//?
			pstmt.setString(1, id);
			//결과리턴
			rs=pstmt.executeQuery();
			while(rs.next()){
				bean=new CarViewBean();
				bean.setName(rs.getString("name"));
				bean.setImg(rs.getString("img"));
				bean.setPrice(rs.getInt("price"));
				bean.setQty(rs.getInt("qty"));
				bean.setUsenavi(rs.getInt("usenavi"));
				bean.setUserin(rs.getInt("userin"));
				bean.setUseseat(rs.getInt("useseat"));
				bean.setUsewifi(rs.getInt("usewifi"));
				bean.setReserveno(rs.getInt("reserveno"));
				v.add(bean);
	
			}
			
		
		} finally{
			if (rs != null) {
				rs.close();
			}
			if (pstmt != null) {
				pstmt.close();
			}
		}
		return v;
	}
	
	//하나의 예약 삭제
	public int carRemoveReserve( int reserveno)  throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		try{
			String sql=" delete from carreserve where reserveno=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, reserveno);
			return pstmt.executeUpdate();
			
		} finally {
			if (pstmt != null) {
				pstmt.close();
			}
		}
	}
		
		
	
	
	
	

}


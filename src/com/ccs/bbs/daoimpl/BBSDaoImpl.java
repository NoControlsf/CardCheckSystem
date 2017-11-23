package com.ccs.bbs.daoimpl;

import com.ccs.bbs.dao.BBSDao;
import com.ccs.util.JdbcUtil;
import com.ccs.util.SysResult;
import org.springframework.stereotype.Repository;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2017/7/4.
 */
@Repository
public class BBSDaoImpl implements BBSDao{
    @Override
    public SysResult selectMainArticle(int pageNumber, int pageSize) {
        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
        int total=0;
        SysResult sysResult=new SysResult();
        sysResult.setPageNumber(pageNumber);
        sysResult.setPageSize(pageSize);
        int iBegPos=(pageNumber-1)*pageSize+1;//起始行
        int iEndPos=pageNumber*pageSize;//末尾行
        JdbcUtil jdbcUtil=new JdbcUtil();
        Connection conn=jdbcUtil.getConnection();
        StringBuffer sb=new StringBuffer();
        sb.append("  WITH z AS ( SELECT*FROM BBSARTICLE WHERE PID = 0)  ");
        sb.append("  SELECT*FROM(SELECT ROWNUM FROWNUM,z.* FROM z WHERE ROWNUM<=  "+iEndPos+")");
        sb.append("  WHERE FROWNUM >= "+iBegPos);
        try {
            Statement st = conn.createStatement();
            ResultSet rs=st.executeQuery(sb.toString());
            //将结果集转换成键值对存放到列表中
            ResultSetMetaData md = rs.getMetaData();
            int columnCount = md.getColumnCount();

            while(rs.next()){
                Map<String, Object> rowData = new HashMap<String, Object>();
                for (int i = 1; i <= columnCount; i++) {
                    rowData.put(md.getColumnName(i), rs.getObject(i));
                }
                list.add(rowData);
            }
            //获取主贴的总数
            String sql="select count(1) from(SELECT*FROM BBSARTICLE WHERE PID = 0)";
            ResultSet rs2=st.executeQuery(sql);
            if(rs2.next()){
                total=rs2.getInt("count(1)");

            }

            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        sysResult.setRows(list);
        sysResult.setTotal(total);
        return sysResult;
    }
}


<%@ page language="java"  pageEncoding="UTF-8"%>
<%@page import="onesun.hbm.member.*,java.util.*,onesun.util.*,onesun.model.*"%>

<script type="text/javascript" charset="UTF-8" src="jslib/jquery-easyui-1.2.5/jquery-1.7.1.min.js"></script>
<script type="text/javascript" charset="UTF-8" src="jslib/jquery-easyui-1.2.5/jquery.easyui.min.js"></script>
<script type="text/javascript" charset="UTF-8" src="jslib/jquery-easyui-1.2.5/locale/easyui-lang-zh_CN.js"></script>

	    <form id="addRoleForm" method="post">  
        <div>  
            <label for="name">Name:</label>  
            <input class="easyui-validatebox" type="text" name="name" data-options="required:true" />  
        </div>  
        <div>  
            <label for="email">Email:</label>  
            <input class="easyui-validatebox" type="text" name="email" data-options="validType:'email'" />  
        </div>  
    </form>  

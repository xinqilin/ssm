# 從intellij 產出的檔案 用 eclipse開  若在pom有錯時
```
找
    <properties>
    </properties>
在裡面加上 <maven-jar-plugin.version>3.1.1</maven-jar-plugin.version>

會變成
    <properties>
        <java.version>1.8</java.version>
	<maven-jar-plugin.version>3.1.1</maven-jar-plugin.version>
    </properties>
之類的  
然後 update maven project
```

```java

<project xmlns="http://maven.apache.org/POM/4.0.0"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
	<modelVersion>4.0.0</modelVersion>
	<groupId>com.bill</groupId>
	<artifactId>ssm</artifactId>
	<version>0.0.1-SNAPSHOT</version>
	<packaging>war</packaging>

	<dependencies>
		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-webmvc</artifactId>
			<version>4.3.7.RELEASE</version>
		</dependency>

		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-jdbc</artifactId>
			<version>4.3.7.RELEASE</version>
		</dependency>

		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-aspects</artifactId>
			<version>4.3.7.RELEASE</version>
		</dependency>

		<dependency>
			<groupId>org.mybatis</groupId>
			<artifactId>mybatis</artifactId>
			<version>3.4.2</version>
		</dependency>
		<dependency>
			<groupId>org.mybatis</groupId>
			<artifactId>mybatis-spring</artifactId>
			<version>1.3.1</version>
		</dependency>
		<dependency>
			<groupId>c3p0</groupId>
			<artifactId>c3p0</artifactId>
			<version>0.9.1</version>
		</dependency>
		<dependency>
			<groupId>mysql</groupId>
			<artifactId>mysql-connector-java</artifactId>
			<version>8.0.15</version>
			<!-- <scope>runtime</scope> -->
		</dependency>
		<dependency>
			<groupId>jstl</groupId>
			<artifactId>jstl</artifactId>
			<version>1.2</version>
		</dependency>

		<dependency>
			<groupId>javax.servlet</groupId>
			<artifactId>servlet-api</artifactId>
			<version>2.5</version>
			<scope>provided</scope>
		</dependency>

		<dependency>
			<groupId>junit</groupId>
			<artifactId>junit</artifactId>
			<version>4.12</version>
		</dependency>

		<dependency>
			<groupId>org.springframework.security</groupId>
			<artifactId>spring-security-config</artifactId>
			<version>3.2.5.RELEASE</version>
		</dependency>



		<!-- https://mvnrepository.com/artifact/org.mybatis.generator/mybatis-generator-core -->
		<dependency>
			<groupId>org.mybatis.generator</groupId>
			<artifactId>mybatis-generator-core</artifactId>
			<version>1.3.7</version>
		</dependency>



		<!-- https://mvnrepository.com/artifact/org.springframework/spring-test -->
		<dependency>
			<groupId>org.springframework</groupId>
			<artifactId>spring-test</artifactId>
			<version>5.2.3.RELEASE</version>
			<scope>test</scope>
		</dependency>

		<!-- https://mvnrepository.com/artifact/junit/junit -->
		<dependency>
			<groupId>junit</groupId>
			<artifactId>junit</artifactId>
			<version>4.12</version>
			<scope>test</scope>
		</dependency>


		<!-- https://mvnrepository.com/artifact/com.fasterxml.jackson.core/jackson-core -->
<dependency>
    <groupId>com.fasterxml.jackson.core</groupId>
    <artifactId>jackson-core</artifactId>
    <version>2.9.8</version>
</dependency>

		<!-- https://mvnrepository.com/artifact/com.fasterxml.jackson.core/jackson-databind -->
<dependency>
    <groupId>com.fasterxml.jackson.core</groupId>
    <artifactId>jackson-databind</artifactId>
    <version>2.10.2</version>
</dependency>





	</dependencies>


</project># SSM-framework-quick-simple-practice
version:
        <dependency>
  			<groupId>org.springframework</groupId>
  			<artifactId>spring-webmvc</artifactId>
  			<version>4.3.7.RELEASE</version>
  		</dependency>
  		
  		<dependency>
  			<groupId>org.springframework</groupId>
  			<artifactId>spring-jdbc</artifactId>
  			<version>4.3.7.RELEASE</version>
  		</dependency>
  		
  		<dependency>
  			<groupId>org.springframework</groupId>
  			<artifactId>spring-aspects</artifactId>
  			<version>4.3.7.RELEASE</version>
  		</dependency>
  		
  		  <dependency>
  			<groupId>org.mybatis</groupId>
  			<artifactId>mybatis</artifactId>
  			<version>3.4.2</version>
  		</dependency>
  		<dependency>
  			<groupId>org.mybatis</groupId>
  			<artifactId>mybatis-spring</artifactId>
  			<version>1.3.1</version>
  		</dependency>
  		<dependency>
  			<groupId>c3p0</groupId>
  			<artifactId>c3p0</artifactId>
  			<version>0.9.1</version>
  		</dependency>
  		<dependency>
  			<groupId>mysql</groupId>
  			<artifactId>mysql-connector-java</artifactId>
  			<version>5.1.41</version>
  		</dependency>
  		<dependency>
  			<groupId>jstl</groupId>
  			<artifactId>jstl</artifactId>
  			<version>1.2</version>
  		</dependency>
  		
  		<dependency>
  			<groupId>javax.servlet</groupId>
  			<artifactId>servlet-api</artifactId>
  			<version>2.5</version>
  			<scope>provided</scope>
  		</dependency>
  		
  		<dependency>
  			<groupId>junit</groupId>
  			<artifactId>junit</artifactId>
  			<version>4.12</version>
  		</dependency>

```

-----------------------------------------------------
### dispatcherServlet
```java

<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:context="http://www.springframework.org/schema/context"
	xmlns:aop="http://www.springframework.org/schema/aop"
	xmlns:mvc="http://www.springframework.org/schema/mvc"
	xmlns:tx="http://www.springframework.org/schema/tx"
	xsi:schemaLocation="http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans-2.5.xsd
						http://www.springframework.org/schema/context http://www.springframework.org/schema/context/spring-context-2.5.xsd
						http://www.springframework.org/schema/mvc 
						http://www.springframework.org/schema/mvc/spring-mvc-3.0.xsd
						http://www.springframework.org/schema/tx http://www.springframework.org/schema/tx/spring-tx-2.5.xsd
						http://www.springframework.org/schema/aop http://www.springframework.org/schema/aop/spring-aop-2.5.xsd">

	<aop:aspectj-autoproxy />
	<mvc:default-servlet-handler />
	<mvc:annotation-driven />


	<context:component-scan base-package="com.ssm" use-default-filters="false">
		<context:include-filter type="annotation" expression="org.springframework.stereotype.Controller" />
	</context:component-scan>

	 <bean class="org.springframework.web.servlet.view.InternalResourceViewResolver"> 
        <property name="prefix" value="/WEB-INF/jsp/"></property>
        <property name="suffix" value=".jsp"></property>
    </bean>


</beans>
```

### 超簡略mapper

```java
	<resultMap class="MenuType" id="resultMenuType">
	<result property="value" column="value" />
		<result property="text" column="text" />
	</resultMap>
	
	<select id='getDropdownOptionByMenuType' parameterClass="java.util.HashMap" resultMap="resultMenuType">
		SELECT id value, option_value text
		FROM dropdown_option
		WHERE menu_type = #menuType#
		AND enable = '1'
	</select>

```



### mapper 基本設定
```java
<typeAlias type="Class的model位置" alias="別名">

<typeAlias type="Model.User" alias="User" />

<resultMap class="User" id="resultUser">
		<result property="id" column="id" />
		<result property="empId" column="emp_id" />
		<result property="name" column="emp_name" />
		<result property="passwd" column="emp_passwd" />
		<result property="group" column="power_user_group" />
		<result property="power_1" column="power_1" />
		<result property="power_2" column="power_2" />
		<result property="power_3" column="power_3" />
		<result property="power_4" column="power_4" />
		<result property="power_5" column="power_5" />
	</resultMap>

```


### mapper 查詢

```java
<select id="SearchUser" parameterClass="java.util.HashMap"
		resultMap="resultUser">
		select * from emp_admin, power_user_admin where emp_admin.power_user_group = power_user_admin.power_user_group
		<dynamic>
			<isNotEmpty prepend="AND" property="id">
				emp_admin.emp_id=#id#
			</isNotEmpty>
			<isNotEmpty prepend="AND" property="blurid">
				emp_admin.emp_id like '%$blurid$%'
			</isNotEmpty>
			<isNotEmpty prepend="AND" property="name">
				emp_admin.emp_name like '%$name$%'
			</isNotEmpty>
			<isNotEmpty prepend="AND" property="group">
				emp_admin.power_user_group like '%$group$%'
			</isNotEmpty>
			<isNotEmpty prepend="AND" property="passwd">
				emp_admin.emp_passwd=#passwd#
			</isNotEmpty>
		</dynamic>
		order by emp_admin.$sort$ $type$, emp_admin.emp_name		
	</select>

```

### mapper insert

```java

	<insert id="AddUser" parameterClass="User">
		insert into emp_admin (emp_id, emp_name, emp_passwd,
		power_user_group) values (#id#, #name#, #passwd#, #group#)
	</insert>

```

### mapper update

```java

    <update id="UpdateDeclaration" parameterClass="Declaration">
		update fixip_declaration set content = #content#, avaliable=#avaliable#, emp_id=#emp_id#, date=#date# where type=#type#
	</update>

    <update id="EditUser" parameterClass="User">
		update emp_admin 
		<dynamic prepend="set">
			<isNotEmpty prepend="," property="name">
				emp_name=#name#
			</isNotEmpty>
			<isNotEmpty prepend="," property="passwd">
				emp_passwd=#passwd#
			</isNotEmpty>
			<isNotEmpty prepend="," property="group">
				power_user_group=#group#
			</isNotEmpty>
		</dynamic>
		where emp_id=#id#
	</update>	


    <update id="EditCM" parameterClass="CM">
		update docsis_modem
		<dynamic prepend="set">
			<isNotEmpty prepend="," property="status">
				status=#status#
			</isNotEmpty>
			<isEqual prepend="," property="status" compareValue="clean">
				status=NULL
			</isEqual>
			<isNotEqual prepend="," property="cmts_vlan" compareValue="-1">
				cmts_vlan=#cmts_vlan#
			</isNotEqual>
			<isNotEmpty prepend="," property="model">
				model=#model#
			</isNotEmpty>
			<isNotEmpty prepend="," property="emp_id">
				emp_id=#emp_id#
			</isNotEmpty>
			<isEmpty prepend="," property="cm_group_name" >
				config_file=#config_file#
			</isEmpty>	
			<isNotEmpty prepend="," property="cm_group_name" >
				config_file=CONCAT(model,'-',#cm_group_name#,'.bin')
			</isNotEmpty>		
		</dynamic>
		where modem_macaddr=#modem_macaddr#
	</update>

```


### mapper delete

```java

	<delete id="DelUser" parameterClass="java.lang.String">
		delete from emp_admin where emp_id=#id#
	</delete>

```

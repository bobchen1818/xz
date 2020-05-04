import pymysql

# 建立一个 MySQL连接
conn = pymysql.connect(
    host='localhost',
    user='root',
    passwd='',
    db='test',
    port=3306,
    charset='utf8'
)

# 获得游标
cur = conn.cursor()
cur.execute("DROP TABLE IF EXISTS test1")
sql = """
CREATE TABLE `test1` (
  `id` int  NOT NULL AUTO_INCREMENT,
  `theatre` char(8) NOT NULL DEFAULT '' COMMENT '手术室',
  `table_number` date NOT NULL DEFAULT '1900/01/01' COMMENT '台次',
  `username` varchar(16) NOT NULL DEFAULT '' COMMENT '姓名',
  `case_number` varchar(8) NOT NULL DEFAULT '' COMMENT '病例号',
  `bed_number` varchar(8) NOT NULL DEFAULT '' COMMENT '床号',
  `doctor` varchar(16) NOT NULL DEFAULT '' COMMENT '主刀医生',
  `depart_name` varchar(16) NOT NULL DEFAULT '' COMMENT '科室',
  `status` varchar(16) NOT NULL DEFAULT '' COMMENT '状态',
  `name` varchar(128) NOT NULL DEFAULT '' COMMENT '手术名称',
  `plan` varchar(16) NOT NULL DEFAULT '' COMMENT '投保方案',
  `plan_code` varchar(32) NOT NULL DEFAULT '' COMMENT '投保方案代码',
  `grade` char(8) NOT NULL DEFAULT '' COMMENT '手术等级',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='手术';
"""
cur.execute(sql)

# 创建一个for循环迭代读取xls文件每行数据的，
# 从第二行开始是要跳过标题行
# 括号里面1表示从第二行开始(计算机是从0开始数)

# close关闭文档
cur.close()
# commit 提交
conn.commit()
# 关闭MySQL链接
conn.close()

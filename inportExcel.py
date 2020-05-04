import xlrd
import pymysql
# 打开数据所在的路径表名
book = xlrd.open_workbook('test1.xlsx')
# 这个是表里的sheet名称（注意大小写）
sheet = book.sheet_by_name('Sheet1')

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
cur.execute("DROP TABLE IF EXISTS test")
sql = """
CREATE TABLE `test` (
      `id` int  NOT NULL AUTO_INCREMENT primary key,
      `name` varchar(8) NOT NULL DEFAULT '' COMMENT '姓名',
      `age` TINYINT 
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
"""
cur.execute(sql)
# 创建插入sql语句
query = 'insert into test(id,name,age)values(%s,%s,%s)'

# 创建一个for循环迭代读取xls文件每行数据的，
# 从第二行开始是要跳过标题行
# 括号里面1表示从第二行开始(计算机是从0开始数)
for r in range(1, sheet.nrows):
    # (r, 0)表示第二行的0就是表里的A1:A1
    id = sheet.cell(r, 0).value
    name = sheet.cell(r, 1).value
    age = sheet.cell(r, 2).value
    values = (id, name, age)
    # 执行sql语句
    cur.execute(query, values)

# close关闭文档
cur.close()
# commit 提交
conn.commit()
# 关闭MySQL链接
conn.close()
# 显示导入多少列
columns = str(sheet.ncols)
# 显示导入多少行
rows = str(sheet.nrows)
print('导入'+columns+'列'+rows+'行数据到MySQL数据库!')
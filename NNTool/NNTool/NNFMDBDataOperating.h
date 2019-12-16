//
//  NNFMDBDataOperating.h
//  NNTool
//
//  Created by cycx on 2019/12/16.
//  Copyright © 2019 cycx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NNTool.h"
@interface NNFMDBDataOperating : NSObject


/**
 单列
 @return 仓库对象
 */
+ (instancetype) shareFMDBDataOperating;

/**
 构造方法
 @param dbName 数据库的名称
 @return 仓库对象
 */
- (instancetype)initDatabaseWithName:(NSString *)dbName;

/**
 构造方法
 @param dbPath 数据库的路径
 @return 仓库对象
 */
- (instancetype)initDatabaseWithPath:(NSString *)dbPath;

/**
 创建表
 @param tableName 表的名字
 */
- (void)creatTableWithName:(NSString *)tableName;

/**
 判断表是否在当前数据库
 @param tableName 表名称
 @return YES OR NO
 */
- (BOOL)isTableExistsWithTableName:(NSString *)tableName;

/**
 清空表内容
 
 @param tableName 表名称
 */
- (void)cleanTableContentWithTableName:(NSString *)tableName;

/**
 删除表
 
 @param tableName 表名称
 */
- (void)dropTableWithTableName:(NSString *)tableName;

/**
 关闭数据库（释放）
 */
- (void)close;

/**
 向表中写数据
 
 @param value 值
 @param key 健
 @param tableName 表名称
 */
- (void)insertValue:(id)value forKey:(NSString *)key intoTable:(NSString *)tableName;

/**
 从表中取数据
 
 @param key 值
 @param tableName 表名称
 @return 值
 */
- (id)getValueByKey:(NSString *)key fromTable:(NSString *)tableName;

/**
 获取所有数据
 
 @param tableName 表名称
 @return 返回所有数据的数组
 */
- (NSArray *)getAllValuesFromTable:(NSString *)tableName;

/**
 删除一条数据
 
 @param key 健
 @param tableName 表名称
 */
- (void)removeValueByKey:(NSString *)key fromTable:(NSString *)tableName;


/**
 批量删除表中的数据
 
 @param keys 健
 @param tableName 表名称
 */
- (void)removeValuesByKeyArray:(NSArray *)keys fromTable:(NSString *)tableName;

/**
 删除数据库
 */
- (void) dropDatabase;

@end

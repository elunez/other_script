/***********************************

> 应用名称：focos
> 下载地址：http://t.cn/AilyJ3mp
> 脚本作者：ddgksf2013
> 微信账号：墨鱼手记
> 解锁说明：解锁高级会员权限
> 更新时间：2023-05-05
> 通知频道：https://t.me/ddgksf2021
> 贡献投稿：https://t.me/ddgksf2013_bot
> 问题反馈：ddgksf2013@163.com
> 特别提醒：如需转载请注明出处，谢谢合作！
> 特别说明：⚠️⚠️⚠️
          本脚本仅供学习交流使用，禁止转载售卖
          ⚠️⚠️⚠️
          
          
[rewrite_local]
  
# > focos☆解锁会员权限（2023-05-05）@ddgksf2013
^https?:\/\/focos\.oracle\.bendingspoonsapps\.com\/v\d\/(users\/setup|purchases\/verify\/apple) url script-response-body focos.vip.js 


[mitm]
 
hostname = focos.oracle.bendingspoonsapps.com


***********************************/




















var obj=JSON.parse($response.body);obj.me.active_subscriptions_ids=["com.focos.1w_t8_1w"],$done({body:JSON.stringify(obj)});

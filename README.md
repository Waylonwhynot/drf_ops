# Drf-Ops

<p align="center">
  <a href="https://www.python.org/">
    <img src="https://img.shields.io/badge/python-3.6.2-brightgreen.svg" alt="python">
  </a>
  <a href="https://docs.djangoproject.com/zh-hans/2.2/">
    <img src="https://img.shields.io/badge/django-2.2-brightgreen.svg" alt="django">
  </a>
  <a href="https://www.django-rest-framework.org/">
    <img src="https://img.shields.io/badge/django%20rest%20framework-3.11.2-brightgreen.svg" alt="drf">
  </a>
  <a href="https://redis.io/">
    <img src="https://img.shields.io/badge/redis-3.2.100-brightgreen.svg" alt="redis">
  </a>
  <a href="https://github.com/vuejs/vue">
    <img src="https://img.shields.io/badge/vue-2.6.10-brightgreen.svg" alt="vue">
  </a>
  <a href="https://github.com/ElemeFE/element">
    <img src="https://img.shields.io/badge/element--ui-2.7.0-brightgreen.svg" alt="element-ui">
  </a>
</p>

## 项目简介
- RBAC （配置权限，前端动态渲染菜单）
- 简单运维工单模型
- 资产管理(支持excel导入，批量导出)，支持webshell执行命令，支持向主机导入文件
- 发布系统：项目名称gitlab和jenkins项目名称必须一样（后面优化）
###  登录页面
![image](https://user-images.githubusercontent.com/42118870/151673686-1fc42639-1b1d-4fe0-a169-0404784b388a.png)
###  首页
![image](https://user-images.githubusercontent.com/42118870/151673703-b5c3467e-9d92-458d-898d-86c61ebab346.png)
### APPID + 消息日志
####  应用ID申请
![image](https://user-images.githubusercontent.com/42118870/151673767-71f7250e-6214-4385-8b55-9aa2ccfab3c7.png)
####  消息日志
![image](https://user-images.githubusercontent.com/42118870/151673804-52d88a6c-a927-4c63-b262-cdcab3aee540.png)
### 简易工单
####  工单申请页面
![image](https://user-images.githubusercontent.com/42118870/151673823-50fea5fe-966a-41d3-894f-7bd3d43833c6.png)
####  工单申请列表
![image](https://user-images.githubusercontent.com/42118870/151673845-250ecf68-ac95-41d4-8b45-b0b6436bfefa.png)
####  工单历史
![image](https://user-images.githubusercontent.com/42118870/151673863-abb3f5f0-a633-4a4d-bb13-6d69049c5d4c.png)
###  任务系统
![image](https://user-images.githubusercontent.com/42118870/151673878-a404f09b-456b-4cc2-b22d-3e61d2b49f7f.png)
![image](https://user-images.githubusercontent.com/42118870/151673885-99340955-c62c-459b-a329-b60814bcd66f.png)
### 发布系统优化
#### 应用页面
![image](https://user-images.githubusercontent.com/42118870/154548438-cb2c09c3-01d1-4e40-b2d0-813d6626379a.png)
#### 添加应用发布
![image](https://user-images.githubusercontent.com/42118870/154548513-54392d11-0ee9-4274-96dc-b49425ea170b.png)
#### 新建常规发布
![image](https://user-images.githubusercontent.com/42118870/154548549-2716c6db-c405-410d-9c36-77f8947d9383.png)
![image](https://user-images.githubusercontent.com/42118870/154548605-6e169304-b533-43f3-9262-5feb42cd671b.png)
![image](https://user-images.githubusercontent.com/42118870/154548668-9c1ca3eb-f58d-49a4-9595-b43b60b30e5b.png)
![image](https://user-images.githubusercontent.com/42118870/154548744-e41958bf-d262-41a1-beba-91a2226e1faa.png)
![image](https://user-images.githubusercontent.com/42118870/154548792-6ddf35da-c8c4-4745-b8e6-a06abaf818d6.png)
#### 发布申请
![image](https://user-images.githubusercontent.com/42118870/154811092-d069a8df-0af8-49ee-a57d-b053a76ed664.png)
#### 新建发布申请
![image](https://user-images.githubusercontent.com/42118870/154811110-f7403123-680b-470d-892f-4719600103b7.png)
#### 待审核
![image](https://user-images.githubusercontent.com/42118870/154811151-4506b020-de33-4c1d-948f-17a76c0255f0.png)
#### 审核
![image](https://user-images.githubusercontent.com/42118870/154811164-a7cfb4b3-990a-4354-bd79-cbec0e6c2445.png)
#### 点击发布
![image](https://user-images.githubusercontent.com/42118870/154811179-b41faa24-ebdd-46fd-b8e1-a0975f956b56.png)

#### 发布结果
![image](https://user-images.githubusercontent.com/42118870/154811069-23796540-17c0-48bf-8daa-36e8eef50221.png)



### 发布系统
####  项目列表（调用gitab api）
![image](https://user-images.githubusercontent.com/42118870/151673896-daf7de93-0b8f-4764-a99e-b07d588079b4.png)
####  项目申请上线
![image](https://user-images.githubusercontent.com/42118870/151673906-057877af-0d23-46d0-898e-eb5455f243e8.png)
####  上线申请列表
![image](https://user-images.githubusercontent.com/42118870/151673845-250ecf68-ac95-41d4-8b45-b0b6436bfefa.png)
####  工单申请列表
![image](https://user-images.githubusercontent.com/42118870/151673923-d037fc45-9c1f-4d18-9207-e4280fe9f890.png)
####  工单处理
![image](https://user-images.githubusercontent.com/42118870/151673929-94598ba4-6910-4888-a8d4-8dc207db3f4c.png)
![image](https://user-images.githubusercontent.com/42118870/151673935-817025e1-38bc-42fd-acb0-b1f5856d060b.png)
####  Jenkins Console OutPut
![image](https://user-images.githubusercontent.com/42118870/151673950-f7d78612-61c0-4809-a0dc-b9170e5e14e0.png)
###  系统管理
![image](https://user-images.githubusercontent.com/42118870/151673974-571d7048-69aa-4100-96fb-0965e20e0ee1.png)
### 资产管理
#### 主机资源（展示）
![image](https://user-images.githubusercontent.com/42118870/153745564-91507e82-a731-4a64-80e3-686081db6025.png)
#### 主机资源添加（展示）
![image](https://user-images.githubusercontent.com/42118870/153745608-f4c4e427-25f9-4e78-aaba-123ca4953f57.png)
#### 主机资源批量添加（Excel导入）
![image](https://user-images.githubusercontent.com/42118870/153745620-952d1da3-d19c-4910-b470-0b37a5b59416.png)
#### 主机webshell + 文件管理
![image](https://user-images.githubusercontent.com/42118870/153745694-71267af2-4dc8-4b20-b77f-8932d5c96691.png)
### 批量任务
![image](https://user-images.githubusercontent.com/42118870/154121342-ccec78ee-c332-4f0c-827f-c191ca1934e5.png)
![image](https://user-images.githubusercontent.com/42118870/154121385-95feb410-680d-49a3-b0dc-e536fca88da8.png)




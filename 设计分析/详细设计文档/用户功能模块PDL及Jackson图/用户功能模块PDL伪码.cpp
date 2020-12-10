//用户功能子程序PDL伪码描述
Procedure 用户功能子程序 is
begin
    if 用户未登录
        then 返回登录界面
    else 
        case：文本记录模块
            run procedure 文本记录模块
        case：个人动态模块
            run procedure 个人动态模块
        case：个人操作模块
            run procedure 个人操作模块
    end if
end 用户功能子程序

Procedure 文本记录模块 is
begin
    用户选择对文本内容进行相关操作
    switch 操作选择：
        case：创建文本记录
            if 用户输入标题
                判断用户输入的标题是否符合规范
                if 符合规范
                    then 保存标题信息
                else if 不符合规范
                    then 不保存标题信息
                    and 显示提示信息
                end if
            else if 用户未输入标题
                then 提示用户填写标题
                and 返回日记编辑页面
            end if
            if 用户输入文本具体内容
                判断用户输入的文本信息是否符合规范
                if 符合规范
                    then 保存文本的信息
                else if 不符合规范
                    then 显示提示信息
                end if
            else if 没有输入文本
                then 提示用户输入具体文本
            end if
            if 用户选择插入图片
                then 调取本地相册选择
                if 用户未选择照片点击确定
                    then 提示错误信息
                else if 用户选择照片点击确定
                    if 选择的照片大于3张
                        then 报错提示信息
                    else if 选择的照片小于等于三张
                        then 选择成功并确定
                        and 返回上一页
                    end if
                else if 用户选择照片后点击返回
                    then 提示用户是否保存照片的信息
                        if 用户选择保存
                            then 返回上一页
                            and 数据库更新并在文章中显示所选照片
                        else if 用户选择不保存
                            then 返回上一页
                        end if
                else if 用户未选择照片点击返回
                    then 返回上一页
                end if
            end if
            if 用户选择at好友
                then 调用好友列表选择
                if 用户未选择好友点击确定
                    then 提示错误信息
                else if 用户选择好友点击确定
                    then 返回上一页
                    and 数据库更新并在文章中显示at用户
                else if 用户选择好友点击返回
                    then 提示用户是否保存at的信息
                        if 用户选择保存
                            then 返回上一页
                            and 数据库更新并在文章中显示at用户
                        else if 用户选择不保存
                            then 返回上一页
                        end if
                else if 用户未选择好友点击返回
                    then 返回上一页
                end if
            end if
            if 用户选择发布地址
                then 调用地址进行定位选择
                if 无法获取GPS信息
                    then 提示用户错误信息
                    and 返回上一层
                else if 可以获取GPS信息
                    then 用户进行位置的选择
                end if
            end if
            文本创建系统前期步骤完成
            if 文本创建系统与操作成功
                then 文本创建成功
                if 用户点击返回
                    提示用户是否保存
                    switch 操作选择
                        case：用户选择保存
                            then 保存当前文本
                            and 跟新对应数据库
                            and 返回上一页
                        case：用户选择不保存
                            then 不保存当前文本
                            and 返回上一页
                    end switch 操作选择
                end if
                if 用户确定保存
                    then 后台跟新数据库
                    and 提示相关信息
                    and 返回上一页
                end if
            else if 文本创建系统与操作失败
                then 提示用户相关的信息
            end if
        end case 创建文本记录
        case：修改文本记录
            用户点击日记详情页面进行相关操作
            if 用户修改标题
                判断修改后的标题是否符合规范
                if 符合规范
                    then 保存标题信息
                else if 不符合规范
                    then 不保存标题信息
                    and 提示用户相关信息
                end if
            else if 用户修改标题为空
                then 提示用户填写标题
            end if
            if 用户修改文本具体内容
                判断用户修改后的文本内容是否符合规范
                if 符合规范
                    then 保存修改后的内容信息
                else if 不符合规范
                    then 不保存修改后的文档
                    and 文档恢复为未修改状态
                    and 提示用户相关信息
                end if
            else if 修改后没有输入文本
                then 提示用户输入具体文本
            end if
            if 用户修改图片
                if 用户选择增加图片
                    then 调取本地相册选择
                    if 用户未选择照片点击确定
                        then 不修改相关内容
                        and 返回上一层页面
                    else if 用户选择照片点击确定
                        if 选择的照片加上已经存在的照片大于3张
                            then 报错提示信息
                        else if 选择的照片加上已经存在的照片小于等于三张
                            then 选择成功并确定
                            and 返回上一页
                        end if
                    else if 用户选择照片后点击返回
                        then 提示用户是否保存照片的信息
                            if 用户选择保存
                                then 返回上一页
                                and 数据库更新并在文章中显示所选照片
                            else if 用户选择不保存
                                then 返回上一页
                            end if
                    else if 用户未选择照片点击返回
                        then 返回上一页
                    end if
                else if 用户选择删除图片
                    then 将在日记中的图片删除
                end if 
            end if 
            if 用户修改at好友
                if 用户增加at好友
                    then 调用好友列表选择
                    if 用户未选择好友点击确定
                        then 提示错误信息
                    else if 用户选择好友点击确定
                        then 返回上一页
                        and 数据库更新并在文章中显示at用户
                    else if 用户选择好友点击返回
                        then 提示用户是否保存at的信息
                            if 用户选择保存
                                then 返回上一页
                                and 数据库更新并在文章中显示at用户
                            else if 用户选择不保存
                                then 返回上一页
                            end if
                    else if 用户未选择好友点击返回
                        then 返回上一页
                    end if
                else if 用户删除在文章中at的好友
                    then 在文章中直接进行修改
                    and 保存修改后的信息
                end if
            end if
            if 用户修改发布地址
                then 调用地址进行定位选择
                if 无法获取GPS信息
                    then 提示用户错误信息
                    and 返回上一层
                else if 可以获取GPS信息
                    then 用户进行位置的修改
                end if
            end if
            文本修改步骤完成
            if 文本修改系统与操作成功
                then 文本修改成功
                if 用户点击返回
                    提示用户是否保存
                    switch 操作选择
                        case：用户选择保存
                            then 保存当前文本
                            and 跟新对应数据库
                            and 返回上一页
                        case：用户选择不保存
                            then 不保存当前文本
                            and 返回上一页
                    end switch 操作选择
                end if
                if 用户确定保存
                    then 后台跟新数据库
                    and 提示相关信息
                    and 返回上一页
                end if
            else if 文本修改系统与操作失败
                then 提示用户相关的信息
            end if
        end case 修改文本记录
        case：删除文本记录
            用户点击日记详情页面进行相关操作
            if 用户选择删除文本
                then 提示用户是否进行删除
                if 用户选择删除
                    then 删除相关文本信息在数据库的记录
                    and 返回上一层页面
                else if 用户选择取消
                    then 返回日记修改的页面
                end if
            end if
        end case 删除文本信息
        case：查询文本记录
            在我的日记页面中进行操作
            用户点击按日期查询则得到日历表
            if 用户在该日期进行过文章创作
                then 该日期被标记
            else if 用户未在该日期进行操作
                then 该日期不被标记
            end if
            用户进行 click 操作
            if 用户 click <<
                then 日期表向前一年
            else if 用户 click <
                then 日期表向前一个月
            else if 用户 click >>
                then 日期表向后一年
            else if 用户 click >
                then 日期表向后一个月
            end if
            通过 click 日期进行操作
            if 日期被标记
                then 跳转到当天日记的详细记录页面
            else if 日记未被标记
                then 不进行相关的操作
            end if
        end case 查询文本记录
    end switch 操作选择
end 文本记录模块

Procedure 个人动态模块is
begin
    用户对个人动态进行相关操作
    switch 操作选择：
        case：创建个人动态
            if 用户输入标签
                判断用户输入的标签是否符合规范
                if 符合规范
                    then 保存标签信息
                else if 不符合规范
                    then 不保存标签信息
                    and 显示提示信息
                end if
            else if 用户未输入标签
                then 提示用户填写标签
                and 返回日记编辑页面
            end if
            if 用户输入文本具体内容
                判断用户输入的文本信息是否符合规范
                if 符合规范
                    then 保存文本的信息
                else if 不符合规范
                    then 显示提示信息
                end if
            else if 没有输入文本
                then 提示用户输入具体文本
            end if
            if 用户选择插入图片
                then 调取本地相册选择
                if 用户未选择照片点击确定
                    then 提示错误信息
                else if 用户选择照片点击确定
                    if 选择的照片大于3张
                        then 报错提示信息
                    else if 选择的照片小于等于三张
                        then 选择成功并确定
                        and 返回上一页
                    end if
                else if 用户选择照片后点击返回
                    then 提示用户是否保存照片的信息
                        if 用户选择保存
                            then 返回上一页
                            and 数据库更新并在文章中显示所选照片
                        else if 用户选择不保存
                            then 返回上一页
                        end if
                else if 用户未选择照片点击返回
                    then 返回上一页
                end if
            end if
            if 用户选择at好友
                then 调用好友列表选择
                if 用户未选择好友点击确定
                    then 提示错误信息
                else if 用户选择好友点击确定
                    then 返回上一页
                    and 数据库更新并在文章中显示at用户
                else if 用户选择好友点击返回
                    then 提示用户是否保存at的信息
                        if 用户选择保存
                            then 返回上一页
                            and 数据库更新并在文章中显示at用户
                        else if 用户选择不保存
                            then 返回上一页
                        end if
                else if 用户未选择好友点击返回
                    then 返回上一页
                end if
            end if
            if 用户选择发布地址
                then 调用地址进行定位选择
                if 无法获取GPS信息
                    then 提示用户错误信息
                    and 返回上一层
                else if 可以获取GPS信息
                    then 用户进行位置的选择
                end if
            end if
            动态创建系统前期步骤完成
            用户进行发布选择
            if 动态创建系统与操作成功
                then 动态创建成功
                if 用户选择保存为草稿
                    then 动态创作保存到草稿数据库
                    and 返回跳转到动态草稿页面
                else if 用户点击返回
                    提示用户是否保存
                    switch 操作选择
                        case：用户选择保存
                            then 保存当前文本
                            and 跟新对应数据库
                            and 返回上一页
                        case：用户选择不保存
                            then 不保存当前文本
                            and 返回上一页
                    end switch 操作选择
                else if 用户选择发布动态
                    then 将动态发表到社区
                    and 跟新数据库的相关信息
                    and 跳转到动态探索页面
            else if 文本创建系统与操作失败
                then 提示用户相关的信息
            end if
        end case 创建个人动态
        case：修改个人动态
            用户点击个人动态详情页面或动态草稿箱进行相关操作
            if 用户修改标签
                判断修改后的标签是否符合规范
                if 符合规范
                    then 保存标签信息
                else if 不符合规范
                    then 不保存标签信息
                    and 提示用户相关信息
                end if
            else if 用户修改标签为空
                then 提示用户填写标签
            end if
            if 用户修改文本具体内容
                判断用户修改后的文本内容是否符合规范
                if 符合规范
                    then 保存修改后的内容信息
                else if 不符合规范
                    then 不保存修改后的文档
                    and 文档恢复为未修改状态
                    and 提示用户相关信息
                end if
            else if 修改后没有输入文本
                then 提示用户输入具体文本
            end if
            if 用户修改图片
                if 用户选择增加图片
                    then 调取本地相册选择
                    if 用户未选择照片点击确定
                        then 不修改相关内容
                        and 返回上一层页面
                    else if 用户选择照片点击确定
                        if 选择的照片加上已经存在的照片大于3张
                            then 报错提示信息
                        else if 选择的照片加上已经存在的照片小于等于三张
                            then 选择成功并确定
                            and 返回上一页
                        end if
                    else if 用户选择照片后点击返回
                        then 提示用户是否保存照片的信息
                            if 用户选择保存
                                then 返回上一页
                                and 数据库更新并在文章中显示所选照片
                            else if 用户选择不保存
                                then 返回上一页
                            end if
                    else if 用户未选择照片点击返回
                        then 返回上一页
                    end if
                else if 用户选择删除图片
                    then 将在日记中的图片删除
                end if 
            end if 
            if 用户修改at好友
                if 用户增加at好友
                    then 调用好友列表选择
                    if 用户未选择好友点击确定
                        then 提示错误信息
                    else if 用户选择好友点击确定
                        then 返回上一页
                        and 数据库更新并在文章中显示at用户
                    else if 用户选择好友点击返回
                        then 提示用户是否保存at的信息
                            if 用户选择保存
                                then 返回上一页
                                and 数据库更新并在文章中显示at用户
                            else if 用户选择不保存
                                then 返回上一页
                            end if
                    else if 用户未选择好友点击返回
                        then 返回上一页
                    end if
                else if 用户删除在文章中at的好友
                    then 在文章中直接进行修改
                    and 保存修改后的信息
                end if
            end if
            if 用户修改发布地址
                then 调用地址进行定位选择
                if 无法获取GPS信息
                    then 提示用户错误信息
                    and 返回上一层
                else if 可以获取GPS信息
                    then 用户进行位置的修改
                end if
            end if
            个人动态修改步骤完成
            if 动态修改系统与操作成功
                then 文本修改成功
                if 用户点击返回
                    提示用户是否保存
                    switch 操作选择
                        case：用户选择保存
                            then 保存当前文本
                            and 跟新对应数据库
                            and 返回上一页
                        case：用户选择不保存
                            then 不保存当前文本
                            and 返回上一页
                    end switch 操作选择
                end if
                if 用户确定保存
                    then 后台跟新数据库
                    and 提示相关信息
                    and 返回上一页
                end if
                if 动态已经发表
                    then 在已经发表动态的数据库中修改
                    and 用户确认后返回上一层
                else if 动态存在草稿箱中
                    then 在草稿箱数据中修改数据
                    and 用户确认后返回上一层
                end if
            else if 文本修改系统与操作失败
                then 提示用户相关的信息
            end if
        end case 修改个人动态
        case：删除个人动态
            用户点击日记详情页面进行相关操作
            判断动态已经发布或存在于草稿箱
            if 动态已经发布
                if 用户选择删除动态
                    then 提示用户是否进行删除
                    if 用户选择删除
                        then 删除相关文本信息在发表动态数据库的记录
                        and 返回上一层页面
                    else if 用户选择取消
                        then 返回日记发布的页面
                    end if
                end if
            else if 动态存在草稿箱中
                if 用户选择删除动态
                    then 提示用户是否进行删除
                    if 用户选择删除
                        then 删除相关文本信息在动态草稿箱中数据库的记录
                        and 返回上一层页面
                    else if 用户选择取消
                        then 返回日记草稿箱的页面
                    end if
                end if
            end if
        end case 修改个人动态
    end switch 操作选择 
end 个人动态模块

Procedure 个人操作模块 is
begin
    switch 操作选择
        case：用户对他人动态及评论点赞
            用户对他人动态进行点赞操作
            if 用户在探索页面发现动态
                if 用户已经对动态进行过点赞
                    then 页面显示相关的信息
                else if 用户未对动态进行点赞
                    then 用户可以对动态进行点赞
                    and 数据库进行相关更新
                    and 刷新当前页面
                end if
            else if 用户进入动态详情页面
                if 用户已经对动态进行过点赞
                    then 页面显示相关的信息
                else if 用户未对动态进行点赞
                    then 用户可以对动态进行点赞
                    and 数据库进行相关更新
                    and 刷新当前页面
                end if
                if 用户对相关评论进行过点赞
                    then 页面显示相关的信息
                else if 用户未对相关评论进行点赞
                    then 用户可以对相关评论进行点赞
                    and 数据库进行相关更新
                    and 刷新当前页面
                end if
            end if
        end case：用户对他人动态及评论点赞
        case：用户对他人动态及评论进行评论
            用户对他人动态进行评论操作
            if 用户在探索页面发现动态
                then 用户可以在动态下方进行评论
                and 动态评论数据库进行对应的更新
                and 刷新当前页面
            else if 用户进入动态详情页面
                if 用户评论动态
                    then 用户可以对动态进行评论
                    and 动态评论数据库进行对应的更新
                    and 刷新当前页面
                else if 用户评论动态评论
                    then 用户可以对动态的评论进行评论
                    and 评论数据库进行对应的更新
                    and 刷新当前页面
                end if
            end if
        end case：用户对他人动态及评论进行评论
    end switch 操作选择
end 个人操作模块





FROM ruby:2.7

# 安装依赖
RUN apt-get update -qq && \
    apt-get install -y build-essential libpq-dev nodejs

# 创建工作目录
WORKDIR /usr/src/app

# 拷贝 Gemfile 和 Gemfile.lock
COPY Gemfile* ./

# 安装 Bundler 和依赖
RUN gem install bundler -v 2.4.22 && bundle _2.4.22_ install

# 拷贝项目文件
COPY . .

# 暴露端口
EXPOSE 4000

# 启动 Jekyll 服务
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]

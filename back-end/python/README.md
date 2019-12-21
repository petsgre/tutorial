1. TemplateDoesNotExist 打印出来当前的 DIRS 目录，看看是否对应

2. ubuntu安装pyenv

echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.bashrc
echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.bashrc
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bashrc

3. 生成 requirements.txt文件
 pip freeze > requirements.txt

4. ** 一个非常坑的地方 **

如果项目名称为大写，会出现ALLOWED_HOSTS的问题，切记，避免项目名称为大写开头
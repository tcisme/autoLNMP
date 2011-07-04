#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

#获取当前目录
cur_dir=$(pwd)


#创建用户
groupadd www
useradd -g www -s /sbin/nologin www
groupadd mysql
useradd -g mysql -s /sbin/nologin mysql


#建立件结构
mkdir -p /web/website
mkdir -p /web/mysql
mkdir -p /usr/local

#删除自带的相关软件
yum -y remove httpd
yum -y remove php
yum -y remove mysql-server mysql
yum -y remove php-mysql


#关闭SeLinux
if [ -s /etc/selinux/config ]; then
sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config
fi

#安装依赖环境
yum -y install gcc gcc-c++ pcre pcre-devel autoconf libjpeg libjpeg-devel libpng libpng-devel freetype freetype-devel libxml2 libxml2-devel zlib zlib-devel glibc glibc-devel glib2 glib2-devel bzip2 bzip2-devel ncurses ncurses-devel curl curl-devel e2fsprogs e2fsprogs-devel krb5 krb5-devel libidn libidn-devel openssl openssl-devel openldap openldap-devel nss_ldap openldap-clients openldap-servers


mkdir -p /home/root/software
cd /home/root/software
wget http://nginx.org/download/nginx-1.0.4.tar.gz
wget http://cn.php.net/get/php-5.2.17.tar.gz/from/this/mirror
wget http://php-fpm.org/downloads/php-5.2.17-fpm-0.5.14.diff.gz
wget http://dev.mysql.com/get/Downloads/MySQL-5.5/mysql-5.5.3-m3.tar.gz/from/http://mysql.he.net/
wget http://ftp.gnu.org/pub/gnu/libiconv/libiconv-1.13.1.tar.gz
wget "http://downloads.sourceforge.net/mcrypt/libmcrypt-2.5.8.tar.gz?modtime=1171868460&big_mirror=0"
wget "http://downloads.sourceforge.net/mcrypt/mcrypt-2.6.8.tar.gz?modtime=1194463373&big_mirror=0"
wget http://pecl.php.net/get/memcache-2.2.5.tgz
wget "http://downloads.sourceforge.net/mhash/mhash-0.9.9.9.tar.gz?modtime=1175740843&big_mirror=0"
wget ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-8.10.tar.gz
wget http://bart.eaccelerator.net/source/0.9.6.1/eaccelerator-0.9.6.1.tar.bz2
wget http://pecl.php.net/get/PDO_MYSQL-1.0.2.tgz
wget http://blog.s135.com/soft/linux/nginx_php/imagick/ImageMagick.tar.gz
wget http://pecl.php.net/get/imagick-2.3.0.tgz




cd /home/root/software

tar zxvf autoconf-2.13.tar.gz
cd autoconf-2.13/
./configure --prefix=/usr/local/autoconf-2.13
make && make install
cd ../

tar zxvf libiconv-1.13.1.tar.gz
cd libiconv-1.13.1/
./configure
make && make install
cd ../

cd /home/root/software
tar zxvf libmcrypt-2.5.8.tar.gz
cd libmcrypt-2.5.8/
./configure
make && make install
/sbin/ldconfig
cd libltdl/
./configure --enable-ltdl-install
make && make install
cd ../../

cd /home/root/software
tar zxvf mhash-0.9.9.9.tar.gz
cd mhash-0.9.9.9/
./configure
make && make install
cd ../

ln -s /usr/local/lib/libmcrypt.la /usr/lib/libmcrypt.la
ln -s /usr/local/lib/libmcrypt.so /usr/lib/libmcrypt.so
ln -s /usr/local/lib/libmcrypt.so.4 /usr/lib/libmcrypt.so.4
ln -s /usr/local/lib/libmcrypt.so.4.4.8 /usr/lib/libmcrypt.so.4.4.8
ln -s /usr/local/lib/libmhash.a /usr/lib/libmhash.a
ln -s /usr/local/lib/libmhash.la /usr/lib/libmhash.la
ln -s /usr/local/lib/libmhash.so /usr/lib/libmhash.so
ln -s /usr/local/lib/libmhash.so.2 /usr/lib/libmhash.so.2
ln -s /usr/local/lib/libmhash.so.2.0.1 /usr/lib/libmhash.so.2.0.1

cd /home/root/software
tar zxvf mcrypt-2.6.8.tar.gz
cd mcrypt-2.6.8/
./configure
make && make install
cd ../

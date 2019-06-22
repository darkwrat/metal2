%define debug_package %{nil}
%define __strip /bin/true
%define __spec_install_post /usr/lib/rpm/brp-compress

Name:		mtproxy
Version:	1
Release:	1%{?dist}
Summary:	mtproto-proxy
License:	GPLv2
URL:		https://github.com/TelegramMessenger/MTProxy
Source0:	https://github.com/TelegramMessenger/MTProxy/archive/v1.tar.gz
Patch0:		mtproxy-no-commit.patch

BuildRequires:	openssl-devel
Requires:	openssl
BuildRequires:	zlib-devel
Requires:	zlib

%description
Official MTProto proxy server

%prep -n MTProxy-1
%setup -q -n MTProxy-1
%patch0

%build
make %{?_smp_mflags}

%install
mkdir -p %{buildroot}/usr/local/mtproxy/bin
install -m 755 objs/bin/mtproto-proxy %{buildroot}/usr/local/mtproxy/bin/mtproto-proxy

%files
/usr/local/mtproxy/bin/mtproto-proxy

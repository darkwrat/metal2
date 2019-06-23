%define debug_package %{nil}
%define __strip /bin/true
%define __spec_install_post /usr/lib/rpm/brp-compress

Name:		ioq3ded
Version:	1
Release:	350b8f9%{?dist}
Summary:	ioq3ded
License:	GPLv2
URL:		https://github.com/ioquake/ioq3
Source0:	https://github.com/ioquake/ioq3/archive/350b8f9c7c88c002dccea4f0350f1919b86d3b4e.zip
Patch0:		ioq3-build-server-only.patch
Patch1:		ioq3-no-make-printouts.patch

%description
ioquake3 dedicated server

%prep -n ioq3-350b8f9c7c88c002dccea4f0350f1919b86d3b4e
%setup -q -n ioq3-350b8f9c7c88c002dccea4f0350f1919b86d3b4e
%patch0
%patch1

%build
make %{?_smp_mflags}

%install
%{__make} copyfiles COPYDIR=%{?buildroot}/usr/local/games/quake3 INSTALL="%{__install} -p -D"

%files
/usr/local/games/quake3/ioq3ded.%{_arch}

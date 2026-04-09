---
title: "How to Survive the Internet Blackout in Iran as a Software Engineer"
description: ""
pubDate: "Apr 9 2026"
heroImage: "../../assets/iran-no-wifi.webp"
---

I want to share my experience as a Site Reliability Engineer currently working at SnappPay, and the things I’ve learned that helped me continue working, stay productive, and even improve my skills during the recent internet blackout in Iran.

For anyone working in software or tech, the idea of functioning without global internet seems impossible. As Iranians, we already deal with heavy restrictions: government filtering, international sanctions, and blocked access to countless essential services. VPNs and tunneling tools became part of our daily workflow—just to study, research, or do basic tasks.

It’s heartbreaking, because none of this is by our choice. We’re all human, and we all deserve equal access to information. But somehow, some people end up “more equal” than others.

When the war between Iran and the US/Israel began, the government switched from a long blacklist to a very short whitelist. In practice, that meant no VPNs worked anymore, and global internet access became impossible. Only Iranian IPs and domestic services were reachable.

Enough background—here’s what I struggled with, and what I did to keep going.

---

## 1. No Google

Imagine trying to work with no Google. That was the first and biggest shock.

I searched for national search engines and found these three:

- https://zarebin.ir
- https://gerdoo.me
- https://search.bertina.ir

How did I even find them without Google?  
Believe it or not, through word of mouth—SMS, phone calls, and national messaging apps.

But let’s be honest: these engines are nowhere near Google. Often, the results are so poor that it’s hard to call them “better than nothing.”

---

## 2. Communication

With no access to Telegram, WhatsApp, Microsoft Teams, and others, communication became a major problem.

I searched for national platforms and found:

- https://web.eitaa.com/
- https://web.bale.ai/
- https://web.splus.ir/
- https://web.rubika.ir/
- https://web.igap.net/

These apps are slow, limited, and none of them offer end‑to‑end encryption. All messages are monitored. This makes them far from ideal for companies that rely on confidentiality and reliability.

Our company used Microsoft Teams, but after the blackout we were left with nothing.  
So we self‑hosted **RocketChat** and **Element** for 600+ users to keep communication and remote work functioning.

But this created another challenge:  
How do you install RocketChat when you can’t access documentation or download container images?

I’ll get to that shortly.

---

## 3. AI

In my daily workflow, I rely heavily on tools like ChatGPT, Gemini, Claude, Qwen, and DeepSeek. When the blackout hit, I lost access to all of them.

So I looked for companies offering locally hosted open‑source LLMs in Iran. I found:

- https://gapgpt.app/
- https://hooshang.ai/

These were surprisingly helpful. I could still write code, troubleshoot, read documentation (to a degree), and get help with tasks.

The main limitation is model freshness: they cannot browse the internet, and their knowledge is frozen at the last training update. So any question about newer documentation becomes hit‑or‑miss.

Still, they worked—and in this situation, “better than nothing” is a win.

---

## 4. DNS

To keep systems running, I needed reliable national DNS servers. Unfortunately, none were consistently stable. I ended up keeping a long list and switching them depending on which sites I needed to access.

It was a daily struggle.

Here’s the list I relied on:

- 185.161.112.33
- 85.15.1.14
- 172.20.11.11
- 172.20.11.12
- 217.218.127.127
- 217.218.155.155
- 178.22.122.100
- 185.51.200.2
- 178.22.122.101
- 185.51.200.1
- 5.200.200.200 — tci
- 217.218.127.127 — recursive1.dci.ir
- 217.218.155.155 — recursive2.dci.ir
- 185.55.224.24 — dns1.begzar.ir
- 185.55.226.26 — dns2.begzar.ir
- 185.55.225.25 — dns3.begzar.ir
- 78.157.42.100 — dns.electro
- 78.157.42.101 — dns.electro
- 87.107.110.109 — recursive1.dnspro.ir
- 87.107.110.110 — recursive2.dnspro.ir

---

## 5. Package registries

During international internet outages in Iran, access to global package registries such as **PyPI, npm, Docker Hub, or Maven Central** can become unreliable or completely unavailable.

so now how to download oackages updates and security updates
for peronal use i found these and some companies get super limited access to fetch security updates but not for all engineer

To keep development workflows running, several Iranian mirrors and registries remain accessible through the national network.

Use the filter below to quickly find mirrors for the package ecosystem you need.

## Filter

<button onclick="filterMirrors('all')">All</button>
<button onclick="filterMirrors('pypi')">PyPI</button>
<button onclick="filterMirrors('npm')">npm</button>
<button onclick="filterMirrors('docker')">Docker</button>
<button onclick="filterMirrors('maven')">Maven</button>
<button onclick="filterMirrors('linux')">Linux</button>
<button onclick="filterMirrors('terraform')">Terraform</button>
<button onclick="filterMirrors('cran')">CRAN</button>

## Mirrors

<table id="mirrors-table">
<thead>
<tr>
<th>Mirror</th>
<th>Packages</th>
</tr>
</thead>
<tbody>

<tr data-tags="linux">
<td><a href="https://mirror.shatel.ir">mirror.shatel.ir</a></td>
<td>Ubuntu, Debian, Kali</td>
</tr>

<tr data-tags="linux">
<td><a href="https://mirrors.kubarcloud.com">mirrors.kubarcloud.com</a></td>
<td>Linux kernel source, open‑source archives</td>
</tr>

<tr data-tags="linux pypi npm">
<td><a href="https://repo-portal.ito.gov.ir/repo">repo-portal.ito.gov.ir</a></td>
<td>CentOS, Fedora, Rocky, Python, npm, Yarn</td>
</tr>

<tr data-tags="maven pypi npm">
<td><a href="https://jamko.ir">jamko.ir</a></td>
<td>Maven, Gradle, Android SDK, APT, RPM, NuGet, Yarn, Composer, pip</td>
</tr>

<tr data-tags="pypi npm">
<td><a href="https://runflare.com/mirrors">runflare.com/mirrors</a></td>
<td>Composer, PyPI, npm, Node.js</td>
</tr>

<tr data-tags="docker">
<td><a href="https://hub.hamdocker.ir">hub.hamdocker.ir</a></td>
<td>Docker images</td>
</tr>

<tr data-tags="linux">
<td><a href="https://repo.iut.ac.ir">repo.iut.ac.ir</a></td>
<td>Debian, Ubuntu, Mint, Arch, Manjaro, Raspbian, Alpine, Rocky, Fedora, OpenSUSE, OpenBSD, CTAN</td>
</tr>

<tr data-tags="maven">
<td><a href="https://maven.myket.ir">maven.myket.ir</a></td>
<td>Maven Central, Google Maven, JitPack, Android SDK</td>
</tr>

<tr data-tags="linux">
<td><a href="https://www.arvancloud.ir/en/dev/linux-repository">arvancloud.ir/dev/linux-repository</a></td>
<td>Debian, Ubuntu, CentOS, Alpine, Arch, OpenSUSE, Manjaro</td>
</tr>

<tr data-tags="linux">
<td><a href="https://mirror.iranserver.com">mirror.iranserver.com</a></td>
<td>Debian, Ubuntu, CentOS</td>
</tr>

<tr data-tags="docker">
<td><a href="https://docker.mobinhost.com">docker.mobinhost.com</a></td>
<td>Docker images</td>
</tr>

<tr data-tags="linux">
<td><a href="https://mirror.mobinhost.com">mirror.mobinhost.com</a></td>
<td>FreeBSD, AlmaLinux, Alpine, Arch, Debian, Fedora EPEL, Manjaro, MariaDB, MongoDB, Raspbian, Ubuntu, Zabbix</td>
</tr>

<tr data-tags="docker">
<td><a href="https://www.arvancloud.ir/fa/dev/docker">arvancloud.ir/fa/dev/docker</a></td>
<td>Docker images</td>
</tr>

<tr data-tags="docker">
<td><a href="https://focker.ir">focker.ir</a></td>
<td>Docker images</td>
</tr>

<tr data-tags="linux docker pypi npm">
<td><a href="https://liara.ir/mirrors">liara.ir/mirrors</a></td>
<td>Linux distributions, programming packages, Docker registry</td>
</tr>

<tr data-tags="maven">
<td><a href="https://en-mirror.ir">en-mirror.ir</a></td>
<td>Google Maven, Maven Central, JitPack</td>
</tr>

<tr data-tags="docker">
<td><a href="https://docker.kernel.ir">docker.kernel.ir</a></td>
<td>Docker images</td>
</tr>

<tr data-tags="terraform">
<td><a href="https://terraform.peaker.info">terraform.peaker.info</a></td>
<td>Terraform providers</td>
</tr>

<tr data-tags="linux">
<td><a href="http://mirror.afranet.com">mirror.afranet.com</a></td>
<td>Debian, Ubuntu, CentOS</td>
</tr>

<tr data-tags="linux">
<td><a href="https://ubuntu.pishgaman.net">ubuntu.pishgaman.net</a></td>
<td>Ubuntu</td>
</tr>

<tr data-tags="linux pypi npm docker">
<td><a href="https://mirrors.pardisco.co">mirrors.pardisco.co</a></td>
<td>Ubuntu, Debian, CentOS, Alpine, PyPI, npm, Go, NuGet, Docker</td>
</tr>

<tr data-tags="cran">
<td><a href="https://cran.um.ac.ir">cran.um.ac.ir</a></td>
<td>CRAN</td>
</tr>

<tr data-tags="linux">
<td><a href="https://ir.archive.ubuntu.com/ubuntu">ir.archive.ubuntu.com</a></td>
<td>Ubuntu</td>
</tr>

<tr data-tags="linux">
<td><a href="https://mirror.0-1.cloud">mirror.0-1.cloud</a></td>
<td>AlmaLinux, Alpine, Arch, CentOS, Debian, EPEL, FreeBSD, Manjaro, MariaDB, Raspbian, Ubuntu, Windows</td>
</tr>

<tr data-tags="linux">
<td><a href="http://mirror.manageit.ir/ubuntu">mirror.manageit.ir</a></td>
<td>Ubuntu</td>
</tr>

<tr data-tags="linux">
<td><a href="http://mirror.aminidc.com">mirror.aminidc.com</a></td>
<td>AlmaLinux, Debian, EPEL, Mint, RHEL, Rocky, Ubuntu, Windows Server</td>
</tr>

<tr data-tags="linux">
<td><a href="https://ubuntu-mirror.kimiahost.com">ubuntu-mirror.kimiahost.com</a></td>
<td>Ubuntu</td>
</tr>

<tr data-tags="linux">
<td><a href="https://mirror.digitalvps.ir/ubuntu">mirror.digitalvps.ir</a></td>
<td>Ubuntu</td>
</tr>

<tr data-tags="linux">
<td><a href="https://ir.ubuntu.sindad.cloud">ir.ubuntu.sindad.cloud</a></td>
<td>Ubuntu</td>
</tr>

<tr data-tags="linux">
<td><a href="https://ir.centos.sindad.cloud">ir.centos.sindad.cloud</a></td>
<td>CentOS</td>
</tr>

<tr data-tags="linux">
<td><a href="https://ir.epel.sindad.cloud">ir.epel.sindad.cloud</a></td>
<td>EPEL</td>
</tr>

<tr data-tags="linux">
<td><a href="http://mirror.faraso.org">mirror.faraso.org</a></td>
<td>CentOS, EPEL, Virtz, Webscript, Chrome, Java</td>
</tr>

<tr data-tags="other">
<td><a href="https://chat.shhh.ir/dl">chat.shhh.ir/dl</a></td>
<td>DeltaChat</td>
</tr>

<tr data-tags="docker npm linux">
<td><a href="https://mirror.atlantiscloud.ir/">mirror.atlantiscloud.ir</a></td>
<td>Ubuntu, Docker Registry, npm</td>
</tr>

<tr data-tags="npm pypi docker">
<td><a href="https://iran.chabokan.net/">chabokan.net</a></td>
<td>npm, Python, PHP, Docker, NuGet</td>
</tr>

<tr data-tags="linux">
<td><a href="https://repo.abrha.net/">abrha.net</a></td>
<td>Ubuntu, AlmaLinux, Debian, EPEL, Proxmox, Avast, ClamAV</td>
</tr>

<tr data-tags="linux">
<td><a href="https://mirror.parsdev.com/">parsdev.com</a></td>
<td>Ubuntu, AlmaLinux, Debian</td>
</tr>

<tr data-tags="linux">
<td><a href="https://linuxmirrors.ir/">linuxmirrors.ir</a></td>
<td>Debian, Ubuntu, Fedora, Rocky, Oracle Linux</td>
</tr>

</tbody>
</table>

---

Despite everything, we adapt. We find ways to keep learning, keep building, and keep moving forward—even when the world goes dark.

I’ll share more technical details and solutions in future posts.

<script>
function filterMirrors(tag) {
  const rows = document.querySelectorAll("#mirrors-table tbody tr");

  rows.forEach(row => {
    if (tag === "all") {
      row.style.display = "";
      return;
    }

    const tags = row.dataset.tags.split(" ");
    row.style.display = tags.includes(tag) ? "" : "none";
  });
}
</script>

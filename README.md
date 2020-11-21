# Web-Blocker
<h3>Description:</h3>
Website blocker with time setting
<h3>What does it do:</h3>
<p>1. create.bat:<br />
Create two directories named Af and Ori at %SystemRoot%\System32\drivers\etc\ (hostfile directory) and copy hosts file to each of the directory. Follow by, copy setting.bat, revert.bat and revertv2.bat to hostfile directory. At the end, it creates 3 task scheduler.
</p>
<p>2. setting.bat:<br />
Check today's day and time, if true, move copy modified hostfile to replace.
</p>
<p>3. revert.bat:<br />
Replace hostfile with orignal hostfile in %SystemRoot%\System32\drivers\etc\Ori
</p>
<p>4. revertv2.bat:<br />
Same goes to revert.bat, but this version is trigger for weekend
</p>

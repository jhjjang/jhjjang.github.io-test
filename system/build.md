```
<?xml version="1.0"?>
<!--

    More faster : lint only modified files
    - - - - - - - - - - - - - - - - - - - -

    We create a new target to retrieve a list of modified files
    If there is modified files, execute the lint target, else skip
    with the `if="modifiedFiles"` option.

    The list of modified files is stored in ${files.modified}, one file per line.

    Feel free to reuse the checkModified target to execute other tasks only on
    newly modified .php files

-->
<project name="test" basedir="." default="lint">
    <!-- A new target to search for modified files -->
    <target name="checkModified" description="Check for modified php files">
        <echo message="Searching for newly modified files" />
        <path id="editedfiles">
            <fileset dir="${basedir}">
                <modified />  <!-- Search only for modified files -->
                <include name="**/*.php" /> <!-- Search only for files with .php extension -->
                <exclude name="**/cache/**" /> <!-- Exclude vendor directory -->
                <exclude name="**/language/**" /> <!-- Exclude vendor directory -->
                <exclude name="**/logs/**" /> <!-- Exclude vendor directory -->
                <exclude name="**/views/**" /> <!-- Exclude vendor directory -->
                <exclude name="assets/**" /> <!-- Exclude vendor directory -->
                <exclude name=".hg/**" /> <!-- Exclude vendor directory -->
                <exclude name="system/**" /> <!-- Exclude vendor directory -->
                <exclude name="template_/**" /> <!-- Exclude vendor directory -->
                <exclude name="user_guide/**" /> <!-- Exclude vendor directory -->
                <exclude name="utils/**" /> <!-- Exclude vendor directory -->
                <exclude name="workplace/**" /> <!-- Exclude vendor directory -->
            </fileset>
        </path>
        <pathconvert pathsep="${line.separator}" property="files.modified" refid="editedfiles" />
        <condition property="modifiedFiles">
            <not>
                <equals arg1="${files.modified}" arg2="" />
            </not>
        </condition>
    </target>
    <!-- The Php Lint target -->
    <!-- Will only execute if and only if there is some modified files -->
    <target name="lint" depends="checkModified" description="Perform syntax check of sourcecode files" if="modifiedFiles">
        <echo message="Linting php files" />
        <exec executable="bash" failonerror="true">
            <arg value="-c" />
            <arg value="echo '${files.modified}' | xargs -n 1 -P 4 php -l" />
        </exec>
    </target>


    <!--

      Just lint all files in parallel
      - - - - - - - - - - - - - - - -
      If you want to lint all files, not only on modified one

    -->
    <target name="lint_all" description="Perform syntax check of sourcecode files">
        <exec executable="bash" failonerror="true">
            <arg value="-c" />
            <arg value="find -L ${basedir} -name '*.php' -print0 | xargs -0 -n 1 -P 4 php -l" />
        </exec>
    </target>

    <target name="sql_all" description="Perform syntax check of sourcecode files">
        <exec executable="bash" failonerror="true">
            <arg value="-c" />
            <arg value="find -L ${basedir} -name '*.php' -print0 | xargs -0 -n 1 -P 4 php -f" />
        </exec>
    </target>

</project>
```

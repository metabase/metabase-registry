It's[DataClassificationPolicy.pdf](https://github.com/user-attachments/files/16657124/DataClassificationPolicy.pdf)
[EncryptionPolicy.pdf](https://github.com/user-attachments/files/16657123/EncryptionPolicy.pdf)
[SystemAccessControlPolicy.pdf](https://github.com/user-attachments/files/16657122/SystemAccessControlPolicy.pdf)
-[AssetManagementPolicy (1).pdf](https://github.com/user-attachments/files/16657130/AssetManagementPolicy.1.pdf)
-[Updated_Bridge_Letter;_8_26_2023_-_4_2024.pdf](https://github.com/user-attachments/files/16657129/Updated_Bridge_Letter._8_26_2023_-_4_2024.pdf)
-[MetabaseSOC2TypeI12622.pdf](https://github.com/user-attachments/files/16657128/MetabaseSOC2TypeI12622.pdf)

-[Phillip Portföy Para Piyasas_ Fonu _zahnamesi_30062023.pdf](https://github.com/user-attachments/files/16657138/Phillip.Portfoy.Para.Piyasas_.Fonu._zahnamesi_30062023.pdf)
-[AssetManagementPolicy.pdf](https://github.com/user-attachments/files/16657137/AssetManagementPolicy.pdf)
-[SoftwareDevelopmentLifeCyclePolicy.pdf](https://github.com/user-attachments/files/16657136/SoftwareDevelopmentLifeCyclePolicy.pdf)


``` <devcontainer> ./diff --git a/.devcontainer/devcontainer.json b/.devcontainer/devcontainer.json
new file mode 100644
index 0000000..c3265c9
--- /dev/null
+++ b/.devcontainer/devcontainer.json
@@ -0,0 +1,12 @@
+
+  "image": "mcr.microsoft.com/devcontainers/universal:2",
+  "features": "git push origin HEAD:refs/for/nougat-mr1-dev"
+ " Or to amend":"an existing commit use"
+
+"git commit":-"-amend"
+"Please make sure you add a commit message": "as it becomes the description for your change."
+
+"Push the": "change for code review"
+
+"git push origin HEAD":"refs/for/nougat-mr1-dev"
+Close this dialog and you should be able to see your recently created change in the 'Outgoing changes' section on the 'Your changes' page.```
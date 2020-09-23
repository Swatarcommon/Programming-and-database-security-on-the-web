namespace Db_Lab_11
{
    partial class Form1
    {
        /// <summary>
        /// Обязательная переменная конструктора.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Освободить все используемые ресурсы.
        /// </summary>
        /// <param name="disposing">истинно, если управляемый ресурс должен быть удален; иначе ложно.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Код, автоматически созданный конструктором форм Windows

        /// <summary>
        /// Требуемый метод для поддержки конструктора — не изменяйте 
        /// содержимое этого метода с помощью редактора кода.
        /// </summary>
        private void InitializeComponent()
        {
            this.SelectFromWorkers = new System.Windows.Forms.Button();
            this.UpdateWorker = new System.Windows.Forms.Button();
            this.AddWorker = new System.Windows.Forms.Button();
            this.DeleteWorker = new System.Windows.Forms.Button();
            this.textBoxDeleteWorker = new System.Windows.Forms.TextBox();
            this.textBoxAddWorker = new System.Windows.Forms.TextBox();
            this.textBoxUpdateWorker = new System.Windows.Forms.TextBox();
            this.textBoxShowWorker = new System.Windows.Forms.TextBox();
            this.ResultTextBox = new System.Windows.Forms.TextBox();
            this.SuspendLayout();
            // 
            // SelectFromWorkers
            // 
            this.SelectFromWorkers.Location = new System.Drawing.Point(39, 51);
            this.SelectFromWorkers.Name = "SelectFromWorkers";
            this.SelectFromWorkers.Size = new System.Drawing.Size(169, 64);
            this.SelectFromWorkers.TabIndex = 0;
            this.SelectFromWorkers.Text = "Показать сотрудников";
            this.SelectFromWorkers.UseVisualStyleBackColor = true;
            this.SelectFromWorkers.Click += new System.EventHandler(this.SelectFromWorkers_Click);
            // 
            // UpdateWorker
            // 
            this.UpdateWorker.Location = new System.Drawing.Point(39, 141);
            this.UpdateWorker.Name = "UpdateWorker";
            this.UpdateWorker.Size = new System.Drawing.Size(169, 64);
            this.UpdateWorker.TabIndex = 1;
            this.UpdateWorker.Text = "Обновить сотрудника под именем...";
            this.UpdateWorker.UseVisualStyleBackColor = true;
            // 
            // AddWorker
            // 
            this.AddWorker.Location = new System.Drawing.Point(39, 234);
            this.AddWorker.Name = "AddWorker";
            this.AddWorker.Size = new System.Drawing.Size(169, 64);
            this.AddWorker.TabIndex = 2;
            this.AddWorker.Text = "Добавить сотрудника";
            this.AddWorker.UseVisualStyleBackColor = true;
            // 
            // DeleteWorker
            // 
            this.DeleteWorker.Location = new System.Drawing.Point(39, 324);
            this.DeleteWorker.Name = "DeleteWorker";
            this.DeleteWorker.Size = new System.Drawing.Size(169, 66);
            this.DeleteWorker.TabIndex = 3;
            this.DeleteWorker.Text = "Уволить сотрудника по имени...";
            this.DeleteWorker.UseVisualStyleBackColor = true;
            // 
            // textBoxDeleteWorker
            // 
            this.textBoxDeleteWorker.Location = new System.Drawing.Point(214, 324);
            this.textBoxDeleteWorker.Multiline = true;
            this.textBoxDeleteWorker.Name = "textBoxDeleteWorker";
            this.textBoxDeleteWorker.Size = new System.Drawing.Size(143, 66);
            this.textBoxDeleteWorker.TabIndex = 4;
            // 
            // textBoxAddWorker
            // 
            this.textBoxAddWorker.Location = new System.Drawing.Point(214, 234);
            this.textBoxAddWorker.Multiline = true;
            this.textBoxAddWorker.Name = "textBoxAddWorker";
            this.textBoxAddWorker.Size = new System.Drawing.Size(143, 64);
            this.textBoxAddWorker.TabIndex = 5;
            // 
            // textBoxUpdateWorker
            // 
            this.textBoxUpdateWorker.Location = new System.Drawing.Point(214, 141);
            this.textBoxUpdateWorker.Multiline = true;
            this.textBoxUpdateWorker.Name = "textBoxUpdateWorker";
            this.textBoxUpdateWorker.Size = new System.Drawing.Size(143, 64);
            this.textBoxUpdateWorker.TabIndex = 6;
            // 
            // textBoxShowWorker
            // 
            this.textBoxShowWorker.Location = new System.Drawing.Point(214, 51);
            this.textBoxShowWorker.Multiline = true;
            this.textBoxShowWorker.Name = "textBoxShowWorker";
            this.textBoxShowWorker.Size = new System.Drawing.Size(143, 64);
            this.textBoxShowWorker.TabIndex = 7;
            // 
            // ResultTextBox
            // 
            this.ResultTextBox.Location = new System.Drawing.Point(382, 51);
            this.ResultTextBox.Multiline = true;
            this.ResultTextBox.Name = "ResultTextBox";
            this.ResultTextBox.Size = new System.Drawing.Size(406, 339);
            this.ResultTextBox.TabIndex = 8;
            this.ResultTextBox.TextChanged += new System.EventHandler(this.ResultTextBox_TextChanged);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.ResultTextBox);
            this.Controls.Add(this.textBoxShowWorker);
            this.Controls.Add(this.textBoxUpdateWorker);
            this.Controls.Add(this.textBoxAddWorker);
            this.Controls.Add(this.textBoxDeleteWorker);
            this.Controls.Add(this.DeleteWorker);
            this.Controls.Add(this.AddWorker);
            this.Controls.Add(this.UpdateWorker);
            this.Controls.Add(this.SelectFromWorkers);
            this.Name = "Form1";
            this.Text = "Form1";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button SelectFromWorkers;
        private System.Windows.Forms.Button UpdateWorker;
        private System.Windows.Forms.Button AddWorker;
        private System.Windows.Forms.Button DeleteWorker;
        private System.Windows.Forms.TextBox textBoxDeleteWorker;
        private System.Windows.Forms.TextBox textBoxAddWorker;
        private System.Windows.Forms.TextBox textBoxUpdateWorker;
        private System.Windows.Forms.TextBox textBoxShowWorker;
        private System.Windows.Forms.TextBox ResultTextBox;
    }
}


using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

using System.Xml.Serialization;
using System.IO;
using System.Xml;
using System.Xml.Linq;

using VaultBCPReadWriterTest.VaultNS;
using VaultBCPReadWriterTest.ItemsNS;

namespace VaultBCPReadWriterTest
{
    public partial class Form1 : Form
    {
        protected static XmlSerializer mItemMasterSerializer;
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            // read the Vault.xml using the DOM
            XmlSerializer ser = new XmlSerializer(typeof(Vault));

            string filename = @"C:\VaultBCP\Export\TestVault2ACADItems\Vault.xml";
            // string filename = @"C:\VaultBCP\GreenOck DTU\Vault.xml";

            Vault myVault = ser.Deserialize(new FileStream(filename, FileMode.Open)) as Vault;
        }

        private void button2_Click(object sender, EventArgs e)
        {
            // read the Vault.xml using the DOM
            XmlSerializer ser = new XmlSerializer(typeof(Itemswrapper));

            // string filename = @"C:\VaultBCP\Export\TestVault2ACADItems\ItemsWrapper.xml";
            string filename = @"C:\VaultBCP\GreenOck DTU\ItemsWrapper.xml";

            Itemswrapper myItemswrapper = ser.Deserialize(new FileStream(filename, FileMode.Open)) as Itemswrapper;
        }

        // test asynchronously reading Itemswrapper
        private void button3_Click(object sender, EventArgs e)
        {
            // IEnumerable<XElement> elements = StreamItems(@"C:\VaultBCP\Export\TestVault2ACADItems\ItemsWrapper.xml");

            // the method below will return immediately without being evaluated
            // meaning they will not be "read" until we request that the are
            // and can selectively process some, all, parts, or others based on certain criteria
            IEnumerable<XElement> elements = StreamItems(@"C:\VaultBCP\GreenOck DTU\ItemsWrapper.xml");

            // get a count of the elements
            int nCount = 0;
            foreach (XElement xl in elements)
            {
                ItemswrapperItemsItemMaster itemMaster = ItemMasterDeSerializer(xl);
                nCount++;

                // do something with the ItemMaster
                // ...

                // set it to null to clear memory?
                itemMaster = null;
            }
        }

        // method to deserialize XElement into 
        static ItemswrapperItemsItemMaster ItemMasterDeSerializer(XElement element)
        {
            if (mItemMasterSerializer == null)
            {
                XmlRootAttribute xRoot = new XmlRootAttribute();
                xRoot.ElementName = "ItemMaster";
                xRoot.Namespace = "http://schemas.autodesk.com/pseb/dm/DataImport/item/2015-04-14";
                xRoot.IsNullable = true;

                mItemMasterSerializer = new XmlSerializer(typeof(ItemswrapperItemsItemMaster), xRoot);
            }

            return (ItemswrapperItemsItemMaster)mItemMasterSerializer.Deserialize(element.CreateReader());
        }

        private static XElement RemoveAllNamespaces(XElement xmlDocument)
        {
            if (!xmlDocument.HasElements)
            {
                XElement xElement = new XElement(xmlDocument.Name.LocalName);

                xElement.Value = xmlDocument.Value;

                foreach (XAttribute attribute in xmlDocument.Attributes())
                {
                    xElement.Add(attribute);
                }


                return xElement;

            }

            return new XElement(xmlDocument.Name.LocalName, xmlDocument.Elements().Select(el => RemoveAllNamespaces(el)));
        }


        // LINQ method that parses for ItemMaster on demand asynchronously
        static IEnumerable<XElement> StreamItems(string uri)
        {
            using (XmlReader reader = XmlReader.Create(uri))
            {
                reader.MoveToContent();

                // Parse the file and display each of the nodes.
                while (reader.Read())
                {
                    switch (reader.NodeType)
                    {
                        case XmlNodeType.Element:
                            if (reader.Name == "ItemMaster")
                            {
                                XElement el = XElement.ReadFrom(reader) as XElement;
                                if (el != null)
                                {
                                    yield return el;
                                }
                            }
                            break;
                    }
                }
            }
        }

    }
}

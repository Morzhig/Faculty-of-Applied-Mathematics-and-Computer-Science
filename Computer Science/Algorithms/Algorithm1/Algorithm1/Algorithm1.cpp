// Сделано с помощью iRunner 2

#include <iostream>
#include <fstream>

using namespace std;

class TRoot 
{
public:
    int Key;
    TRoot* Left;
    TRoot* Right;

    TRoot(int key)
    {
        Key = key;
        Left = 0;
        Right = 0;
    }
};

class TTree
{
public:

    TRoot* Root;

    TTree()
    {
        Root = 0;
    }

    ~TTree()
    {
        DestroyNode(Root);
    }

    void add(int x)
    {
        TRoot** cur = &Root;
        while (*cur)
        {
            TRoot& node = **cur;
            if (x < node.Key) 
            {
                cur = &node.Left;
            }
            else if (x > node.Key) 
            {
                cur = &node.Right;
            }
            else 
            {
                return;
            }
        }
        *cur = new TRoot(x);
    }

    void obhod(TRoot* root, ofstream& out)
    {
        if (root == NULL)
            return;

        out << root->Key << endl;

        obhod(root->Left, out);
        obhod(root->Right, out);
    }

private:
    static void DestroyNode(TRoot* node)
    {
        if (node)
        {
            DestroyNode(node->Left);
            DestroyNode(node->Right);
            delete node;
        }
    }
};

int main()
{
    ifstream fin("input.txt");
    ofstream fout("output.txt");

    TTree tree;
    long long a;

    while (fin >> a)
        tree.add(a);

    tree.obhod(tree.Root, fout);

    return 0;
}
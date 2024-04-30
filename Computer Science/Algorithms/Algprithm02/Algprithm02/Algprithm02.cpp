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

    TRoot* delete_(TRoot* root, int key)
    {
        if (!root)
        {
            return root;
        }
        if (key < root->Key)
        {
            root->Left = delete_(root->Left, key);
            return root;
        }

        else if (key > root->Key)
        {
            root->Right = delete_(root->Right, key);
            return root;
        }

        if (root->Left == NULL)
            return root->Right;
        else if (root->Right == NULL)
            return root->Left;
        else
        {
            int min_key = find_min(root->Right).Key;
            root->Key = min_key;
            root->Right = delete_(root->Right, min_key);
            return root;
        }
    }

    TRoot find_min(TRoot* root)
    {
        if (root->Left != NULL)
            return find_min(root->Left);
        else
            return *root;
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

    long long key;
    fin >> key;

    while (fin >> a)
        tree.add(a);

    tree.Root = tree.delete_(tree.Root, key);

    tree.obhod(tree.Root, fout);

    return 0;
}
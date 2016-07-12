import libyaml

func printt(_ v: Any) {
    print(v.dynamicType)
}

final public class Parser {

    private var _parser: yaml_parser_s

    public init() {
        _parser = yaml_parser_t()
        if yaml_parser_initialize(&_parser) == 0 { fatalError() }
    }

    public init(string: String) {
        _parser = yaml_parser_t()
        if yaml_parser_initialize(&_parser) == 0 { fatalError() }
        yaml_parser_set_input_string(&_parser, string, string.utf8.count)
    }

    public init(filePath: String) {
        fatalError("Not implemented")
        //FILE *input = fopen("...", "rb");
        //yaml_parser_set_input_file(&_parser, input);
    }

    deinit {
        yaml_parser_delete(&_parser)
    }
}

enum NodeType {
    case string(String)

    private init(_node: Node) {
        switch _node.pointee.type {
        case YAML_SCALAR_NODE:

            switch _node.tag {
            }

            //FIXME: Use length and style
            let str = String(validatingUTF8: UnsafeMutablePointer<Int8>(_node.pointee.data.scalar.value))!
            self = .string(str)
        default:
            fatalError("Unhandled")
        }
    }

}

final class Node {
    let type: NodeType
    let tag: String
    private let _node: UnsafeMutablePointer<yaml_node_s>

    private init(_node: UnsafeMutablePointer<yaml_node_s>) {
        self._node = _node
        type = NodeType(_node: self)
        tag = String(validatingUTF8: UnsafeMutablePointer<Int8>(_node.pointee.tag))!
    }
}

final public class Document {
    private var _document: yaml_document_s

    public init(parser: Parser) {
        _document = yaml_document_t()
        if yaml_parser_load(&parser._parser, &_document) == 0 {
            fatalError()
        }
    }

    var rootNode: Node? {
        guard let node = yaml_document_get_root_node(&_document) else {
            return nil
        }
        return Node(_node: node)
    }

    deinit {
        yaml_document_delete(&_document)
    }
}


let string = " Hello"
let parser = Parser(string: string)
let document = Document(parser: parser)
if let rootNode = document.rootNode {
    print(rootNode.tag)
    print(rootNode.type)
}




